<?php echo $header; ?>

<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?>
            <a href="<?php echo $breadcrumb['href']; ?>">
                <?php echo $breadcrumb['text']; ?>
            </a>
        <?php } ?>
    </div>

    <?php if ($error_warning) { ?>
        <div class="warning">
            <?php echo $error_warning; ?>
        </div>
    <?php } ?>

    <div class="box">
        <div class="heading">
            <h1>
                <img src="view/image/module.png" alt="Expressly" />
                <?php echo $heading_title; ?>
            </h1>
            <div class="buttons">
                <a onclick="$('#form').submit();return false;" class="button">
                    <?php echo $button_save; ?>
                </a>

                <a href="<?php echo $cancel; ?>" class="button">
                    <?php echo $button_cancel; ?>
                </a>
            </div>
        </div>

        <div class="content">
            <form action="<?php echo $action; ?>" method="POST" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><?php echo $shop_name; ?></td>
                        <td>
                            <input type="text" name="expressly_shop_name" value="<?php echo $expressly_shop_name; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $image; ?></td>
                        <td>
                            <input type="text" name="expressly_image" value="<?php echo $expressly_image; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $terms; ?></td>
                        <td>
                            <input type="text" name="expressly_terms" value="<?php echo $expressly_terms; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $privacy; ?></td>
                        <td>
                            <input type="text" name="expressly_privacy" value="<?php echo $expressly_privacy; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $destination; ?></td>
                        <td>
                            <input type="text" name="expressly_destination" value="<?php echo $expressly_destination; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $offer; ?></td>
                        <td>
                            <input type="hidden" name="expressly_offer" value="0" />
                            <input type="checkbox" name="expressly_offer" value="1" <?php echo ($expressly_offer == 1 ? ' checked="checked"' : ''); ?> />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $password; ?></td>
                        <td>
                            <input type="text" name="expressly_password" value="<?php echo $expressly_password; ?>" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

<?php echo $footer; ?>