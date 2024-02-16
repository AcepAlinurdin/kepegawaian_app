<?php

namespace Winter\User;

use Backend;
use Backend\Models\UserRole;
use System\Classes\PluginBase;

/**
 * user Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     */
    public function pluginDetails(): array
    {
        return [
            'name'        => 'winter.user::lang.plugin.name',
            'description' => 'winter.user::lang.plugin.description',
            'author'      => 'Alexey Bobkov, Samuel Georges',
            'icon'        => 'icon-user',
            'homepage'    => 'https://github.com/wintercms/wn-user-plugin',
            'replaces'    => ['RainLab.User' => '<= 1.5.4'],
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     */
    public function register(): void
    {
    }

    /**
     * Boot method, called right before the request route.
     */
    public function boot(): void
    {
    }

    /**
     * Registers any frontend components implemented in this plugin.
     */
    public function registerComponents(): array
    {
        return []; // Remove this line to activate

        return [
            'Winter\User\Components\MyComponent' => 'myComponent',
        ];
    }

    /**
     * Registers any backend permissions used by this plugin.
     */
    public function registerPermissions(): array
    {
        return []; // Remove this line to activate

        return [
            'winter.user.some_permission' => [
                'tab' => 'winter.user::lang.plugin.name',
                'label' => 'winter.user::lang.permissions.some_permission',
                'roles' => [UserRole::CODE_DEVELOPER, UserRole::CODE_PUBLISHER],
            ],
        ];
    }

    /**
     * Registers backend navigation items for this plugin.
     */
    public function registerNavigation(): array
    {

        return [
            'user' => [
                'label'       => 'Kepegaiwan',
                'url'         => Backend::url('winter/user/Users'),
                'icon'        => 'icon-user',
                'iconSvg'     => 'modules/backend/assets/images/user.png',
                'permissions' => ['winter.user.*'],
                'order'       => 500,
                'sideMenu' => [
                    'users' => [
                        'label' => 'Users',
                        'icon'        => 'icon-user',
                        'url'         => Backend::url('winter/user/users'),
                        'permissions' => ['winter.users.access_users']
                    ],
                    'pekerjaan' => [
                        'label' => 'Pekerjaan',
                        'icon'        => 'icon-briefcase',
                        'url'         => Backend::url('winter/user/pekerjaan'),
                        'permissions' => ['winter.users.access_users']
                    ],
                ],
            ],
        ];
    }
}
