<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Memo extends Model
{
    use HasFactory;

    public function getMyMemo(){
        $query_tag = \Request::query('tag');
        //-----ベースのメソッド
        $query=Memo::query()->select('memos.*')
            ->where('user_id', '=', \Auth::id())
            ->whereNull('deleted_at')
            ->orderBy('updated_at', 'DESC');
         //-----ベースのメソッドここまで

        // 230103_1526 sec48で、AppServiceProvider.phpの箇所31-48行目までをmwmo.phpに転記

        // $query_tag = \Request::query('tag');
        // dd($query_tag);

        // もしクエリパラメータがあれば
        if(! empty($query_tag)){

            // タグで絞り込み
            // $memos = Memo::select('memos.*')
            $query->leftJoin('memo_tags', 'memo_tags.memo_id', '=', 'memos.id')
                ->where('memo_tags.tag_id', '=', $query_tag);
            // ->where('user_id', '=', \Auth::id())
            // ->whereNull('deleted_at')
            // ->orderBy('updated_at', 'DESC')
            // ->get();

        

        //230103_1546 sec48 05:47でコメントアウト
        // }else{
        // // タグがなければ全て取得
        // //ここでメモを取得 sec32 0:55辺り
        // $memos = Memo::select('memos.*')
        //     ->where('user_id', '=', \Auth::id())
        //     ->whereNull('deleted_at')
        //     ->orderBy('updated_at', 'DESC')
        //     ->get();

        }
        // 230103_1553 sec48 1行追加
        $memos=$query->get();

        return $memos;
    }
}
