<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Memo;
use App\Models\Tag;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //230103_1347 sec45で記載 view composer/ HomeControllerから転記
        view()->composer('*', function ($view) {
            // 230103_1526 sec48で、以下の箇所31-48行目までをmwmo.phpに転記
            // $query_tag = \Request::query('tag');
            // // dd($query_tag);

            // // もしクエリパラメータがあれば
            // if(! empty($query_tag)){

            // // タグで絞り込み

            // }else{
            // // タグがなければ全て取得
            // //ここでメモを取得 sec32 0:55辺り
            //     $memos = Memo::select('memos.*')
            //         ->leftJoin('memo_tags','memo_tags.memo_id','=','memos.id')
            //         ->where('memo_tags.tag_id','=',$query_tag)
            //         ->where('user_id', '=', \Auth::id())
            //         ->whereNull('deleted_at')
            //         ->orderBy('updated_at', 'DESC')
            //         ->get();
            // }    

            // 230103_1531 sec48 自作関数はインスタンス化必要。Memo.phpから持ってくる
            //インスタンス化
            $memo_model = new Memo();
            // メモ取得
            $memos = $memo_model->getMyMemo();


            $tags = Tag::where('user_id', '=', \Auth::id())
                ->whereNull('deleted_at')
                ->orderBy('updated_at', 'DESC')
                ->get();

            $view->with('memos', $memos)->with('tags',$tags);
        });
    }
}
