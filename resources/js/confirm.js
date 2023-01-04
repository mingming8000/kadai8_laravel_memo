function deleteHandle(event){
    //230103_1649 preventDefaultの１行で、いったんformをストップできる
    event.preventDefault();
    if(window.confirm('本当に削除していいですか？')){
        
        document.getElementById('delete-form').submit();
    }else{
        alert('キャンセルしました');
    }
}