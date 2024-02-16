<?php namespace Winter\User\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Users Backend Controller
 */
class Users extends Controller
{
    /**
     * @var array Behaviors that are implemented by this controller.
     */
    public $implement = [
        \Backend\Behaviors\FormController::class,
        \Backend\Behaviors\ListController::class,
    ];

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Winter.User', 'user', 'users');
    }
}
