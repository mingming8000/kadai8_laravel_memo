@extends('layouts.app')

{{-- 230103_1635 sec50 javascriptの埋め込み --}}
@section('javascript')
<script src="/js/confirm.js"></script>

@endsection

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between">
        メモ編集
        <form id="delete-form" action="{{route('destroy')}}" method="POST">
            @csrf
            <input type="hidden" name="memo_id" value="{{ $edit_memo[0]['id']}}" />
            {{-- 230103_1643 sec50 の３分すぎ。confrim.jsに中身をこれから書く --}}
            {{-- <button type="submit" onclick="deleteHandle(event);">削除</button> --}}
            {{-- 230103_1814 fontAwesomeのtrashアイコンが以下 --}}
            <i class="fa-solid fa-trash mr-3" onclick="deleteHandle(event)"></i>
        </form>
    </div>
    {{--route('store')と書くと　/store --}}
    {{-- 230103_1840 layout.css用のclass設定＝my-card-body --}}        
    <form class="card-body my-card-body" action="{{route('update')}}" method="POST">
        @csrf
        <input type="hidden" name="memo_id" value="{{ $edit_memo[0]['id']}}" />
        <div class="form-group">
            <textarea class="form-control" name="content" rows="3" placeholder="ここにメモを入力">
                {{$edit_memo[0]['content']}}
            </textarea>
        </div>
        {{-- 230103_1615 sec49 2:51辺り laravel8のreadoubleから→create.blade.php　12-16行目コピー--}}
        @error('content')
            <div class="alert alert-danger">メモ内容を入力してください</div>
        @enderror
        @foreach ($tags as $t)
        <div class="form-check form-check-inline mb-3"> 
            {{-- 230103 10:28 sec43 12:51 --}}
            {{-- ３項演算子：if文を１行で書く方法 {{ 条件　？　trueだったら　：　falseだったら　}} --}}
            {{-- もし$include_tags にループで回っているタグのidが含まれれば、checkedを書く --}}
            <input class="form-check-input" type="checkbox" name="tags[]" id="{{ $t['id']}}" value="{{$t['id']}}"{{in_array($t['id'],$include_tags) ? 'checked' : '' }}>
            <label class="form-check-label" for="{{$t['id']}}">{{$t['name']}}</label>
        </div>
        @endforeach
        {{-- 220103 1042 sec43 15:51 create.blade.phpから以下の１行をコピーすると、chk boxのチェックが判別するように --}}
        <input type="text" class="form-control w-50 mb-3" name="new_tag" placeholder="新しいタグを入力" />
        <button type="submit" class="btn btn-primary">更新</button>
    </form>
</div>
