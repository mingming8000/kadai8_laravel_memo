<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Memo;
use App\Models\Tag;
use App\Models\MemoTag;
use DB;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //230103 1356 sec45でAppServiceProviderに転記
        // 230103 0821 sec41
        $tags = Tag::where('user_id', '=', \Auth::id())->whereNull('deleted_at')->orderBy('id', 'DESC')
            ->get();

        return view('create',compact('tags'));
    }
    public function store(Request $request)
    {
        $posts = $request->all();
        // 230103_1559 sec49 の最初の処理
        $request->validate(['content' => 'required']);
        // dump dieの略->メソッドの引数の取った値を展開して止める->データ確認のデバッグ関数
        //dd(\Auth::id()); sec31 　9:52で削除

        //  230103 0712 sec39
        // ＝＝＝＝ここからトランザクション開始＝＝＝＝
        DB::transaction(function() use($posts){

            $memo_id=Memo::insertGetId(['content' => $posts['content'], 'user_id' => \Auth::id()]);

            // 230103 0734 sec39

            $tag_exists = Tag::where('user_id', '=', \Auth::id())->where('name', '=', $posts['new_tag'])
                ->exists();
            // sec39 新規タグが入力されてるかチェック
            // sec39 新規タグが既に存在しなければ、tagsテーブルにインサートIDを取得
            if( !empty($posts["new_tag"]) && !$tag_exists ){
                // sec39 新規タグが既に存在しなければ、tagsテーブルにインサートIDを取得
                $tag_id = Tag::insertGetId(['user_id' => \Auth::id(), 'name' => $posts['new_tag']]);
                // memo_tagsにインサートして、メモとタグを紐つける
                MemoTag::insert(['memo_id'=> $memo_id,'tag_id'=>$tag_id]);
            }
            // 230103 0853 sec41 08:43辺り
            // きぞんタグに紐付けられた場合、memo_tagsにインサート
            if(!empty($posts['tags'][0])){
                foreach($posts['tags'] as $tag){
                    MemoTag::insert(['memo_id' => $memo_id, 'tag_id' => $tag]);
                
                 }
            }
            
        });
        // ＝＝＝＝ここまでがトランザクションの範囲＝＝＝＝

            //return view('create');　sec31 　9:52で削除

        return redirect(route('home'));
    }

    public function edit($id)
    {
        //ここでメモを取得 sec32 0:55辺り
        //230103 1359 sec45　AppServiceProviderのview controllerでまとめてやるので不要に。
        // $memos = Memo::select('memos.*')
        //     ->where('user_id', '=', \Auth::id())
        //     ->whereNull('deleted_at')
        //     ->orderBy('updated_at', 'DESC')
        //     ->get();

        $edit_memo = Memo::select('memos.*', 'tags.id AS tad_id')
            ->leftJoin('memo_tags', 'memo_tags.memo_id', '=', 'memos.id')
            ->leftJoin('tags', 'memo_tags.tag_id', '=', 'tags.id')

            ->where('memos.user_id', '=', \Auth::id())
            ->where('memos.id', '=', $id)
            ->whereNull('memos.deleted_at')
            ->get();

        $include_tags = [];
        foreach($edit_memo as $memo){
            array_push($include_tags, $memo['tag_id']);
        }
        //230103 1015 sec43 09:06 @ルノアールに移動 
        $tags = Tag::where('user_id', '=', \Auth::id())->whereNull('deleted_at')->orderBy('id', 'DESC')
        ->get();

        //dd($include_tags);
        return view('edit',compact('edit_memo','include_tags','tags'));
    }

    public function update(Request $request)
    {
        $posts = $request->all();
        //230103_1620 sec49の最後辺り　このファイルの40行目から転記。
        $request->validate(['content' => 'required']);

        // 230103 1050 sec44 0:48 タグ
        // トランザクションスタート
        DB::transaction(function () use($posts) {
            // Memo::where('id',$posts['memo_id'])->update(['content' => $posts['content'], 'user_id' => \Auth::id()]);
            Memo::where('id', $posts['memo_id'])->update(['content' => $posts['content']]);
            // 一旦メモとタグの紐付けを削除
            MemoTag::where('memo_id', '=', $posts['memo_id'])->delete();
            // 再度メモとタグの紐付け
            //230103 12:01 sec44終了後のbug退治への挑戦。githubの正解データを見ながら、以下1行追加。
            if (!empty($posts['tags'])) {
            // 230103 12:01 sec44終了後のbug退治への挑戦。githubの正解データを見ながら。。
                foreach ($posts['tags'] as $tag) {
                    MemoTag::insert(['memo_id' => $posts['memo_id'], 'tag_id' => $tag]);
                }
            }
            // 新規タグが入力されているかチェック
            // もし、新しいタグの入力があれば、インサートして紐付ける
            $tag_exists = Tag::where('user_id', '=', \Auth::id())->where('name', '=', $posts['new_tag'])
                ->exists();

            // もし、新しいタグの入力があれば、インサートして紐付け、以下は上の40行目？辺りからコピーしたもの
            // sec39 新規タグが入力されてるかチェック
            // sec39 新規タグが既に存在しなければ、tagsテーブルにインサートIDを取得
            if (!empty($posts["new_tag"]) && !$tag_exists) {
                // sec39 新規タグが既に存在しなければ、tagsテーブルにインサートIDを取得
                $tag_id = Tag::insertGetId(['user_id' => \Auth::id(), 'name' => $posts['new_tag']]);
                // memo_tagsにインサートして、メモとタグを紐つける
                MemoTag::insert(['memo_id' => $posts['memo_id'], 'tag_id' => $tag_id]);
            }
        });
        //トランザクションはここまで

        // dump dieの略->メソッドの引数の取った値を展開して止める->データ確認のデバッグ関数


        return redirect(route('home'));
    }

    public function destroy(Request $request)
    {
        $posts = $request->all();
        // dd($posts);

        // dump dieの略->メソッドの引数の取った値を展開して止める->データ確認のデバッグ関数

        Memo::where('id',$posts['memo_id'])->update(['deleted_at' => date("Y-m-d H:i:s",time())]);

        return redirect(route('home'));
    }
}
