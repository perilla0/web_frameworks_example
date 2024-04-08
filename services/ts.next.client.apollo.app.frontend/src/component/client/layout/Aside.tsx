import { Sidebar } from "flowbite-react";

export default function Aside() {
  console.log("exec: Aside");

  return (
    <Sidebar
      aria-label="Default sidebar example"
      id="sidebar"
      className={`fixed top-0 left-0 h-screen min-h-svh pt-14 bg-white border-r border-gray-200 dark:bg-gray-800 dark:border-gray-700`}
    >
      <div>
        <p>TemplateAside</p>
      </div>
    </Sidebar>
  );
}