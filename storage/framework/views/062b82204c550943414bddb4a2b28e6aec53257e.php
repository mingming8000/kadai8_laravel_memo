<?php $__env->startSection('javascript'); ?>
<script src="/js/confirm.js"></script>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="card">
    <div class="card-header d-flex justify-content-between">
        メモ編集
        <form id="delete-form" action="<?php echo e(route('destroy')); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <input type="hidden" name="memo_id" value="<?php echo e($edit_memo[0]['id']); ?>" />
            
            
            
            <i class="fa-solid fa-trash mr-3" onclick="deleteHandle(event)"></i>
        </form>
    </div>
    
            
    <form class="card-body my-card-body" action="<?php echo e(route('update')); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <input type="hidden" name="memo_id" value="<?php echo e($edit_memo[0]['id']); ?>" />
        <div class="form-group">
            <textarea class="form-control" name="content" rows="3" placeholder="ここにメモを入力">
                <?php echo e($edit_memo[0]['content']); ?>

            </textarea>
        </div>
        
        <?php $__errorArgs = ['content'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="alert alert-danger">メモ内容を入力してください</div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
        <?php $__currentLoopData = $tags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $t): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="form-check form-check-inline mb-3"> 
            
            
            
            <input class="form-check-input" type="checkbox" name="tags[]" id="<?php echo e($t['id']); ?>" value="<?php echo e($t['id']); ?>"<?php echo e(in_array($t['id'],$include_tags) ? 'checked' : ''); ?>>
            <label class="form-check-label" for="<?php echo e($t['id']); ?>"><?php echo e($t['name']); ?></label>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        
        <input type="text" class="form-control w-50 mb-3" name="new_tag" placeholder="新しいタグを入力" />
        <button type="submit" class="btn btn-primary">更新</button>
    </form>
</div>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Applications/MAMP/htdocs/221224_Laravel/230101_laravel-simple-memo/resources/views/edit.blade.php ENDPATH**/ ?>