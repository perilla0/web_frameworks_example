import Link from "next/link";
import { Avatar, Dropdown, Navbar, Button } from "flowbite-react";
import { HiMenuAlt1 } from "react-icons/hi";

import { useTheme, useThemeDispatch } from "@/component/client/ThemeContext";

export default function Header() {
  console.log("exec: TemplateHeader");

  const theme = useTheme();
  const dispatch = useThemeDispatch();

  return (
    <Navbar
      id="header"
      fluid={true}
      rounded={true}
      className={`bg-white border-b border-gray-200 px-4 py-2.5 dark:bg-gray-800 dark:border-gray-700 fixed left-0 right-0 top-0`}
    >
      <Button size="sm" id="mobile-sidebar-visible-toggle-button"
        onClick={ () => {
          console.log('Sidebar Clicked:');
          console.log(theme);
          theme.mobile.sidebar.visible.status = ! theme.mobile.sidebar.visible.status;
          dispatch({'type': 'changed'});
        }}
      >
        <HiMenuAlt1 className="h-6 w-6" />
      </Button>
      <Navbar.Brand as={Link} href="/">
        <span
          className={`self-center whitespace-nowrap text-xl font-semibold dark:text-white`}
        >
          Next.js
        </span>
      </Navbar.Brand>
      <div className="flex md:order-2">
        <Dropdown
          arrowIcon={false}
          inline
          label={<Avatar alt="User settings" rounded />}
        >
          <Dropdown.Header>
            <span className="block text-sm">あなたのお名前</span>
            <span className="block truncate text-sm font-medium">
              test@example.com
            </span>
          </Dropdown.Header>
          <Dropdown.Item>ダッシュボード</Dropdown.Item>
          <Dropdown.Item>設定</Dropdown.Item>
          <Dropdown.Divider />
          <Dropdown.Item>サインアウト</Dropdown.Item>
        </Dropdown>
      </div>
    </Navbar>
  );
}