<?php $__env->startSection('content'); ?>
<div class="card">
    <div class="card-header">新規メモ作成</div>
    
            
    <form class="card-body my-card-body" action="<?php echo e(route('store')); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <div class="form-group">
            <textarea class="form-control" name="content" rows="3" placeholder="ここにメモを入力"></textarea>
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
            <input class="form-check-input" type="checkbox" name="tags[]" id="<?php echo e($t['id']); ?>" value="<?php echo e($t['id']); ?>">
            <label class="form-check-label" for="<?php echo e($t['id']); ?>"><?php echo e($t['name']); ?></label>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
         
        <input type="text" class="form-control w-50 mb-3" name="new_tag" placeholder="新しいタグを入力" />
        <button type="submit" class="btn btn-primary">保存</button>
    </form>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Applications/MAMP/htdocs/221224_Laravel/230101_laravel-simple-memo/resources/views/create.blade.php ENDPATH**/ ?>