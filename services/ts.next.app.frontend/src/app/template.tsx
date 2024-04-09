"use client";

import { Flowbite } from "flowbite-react";

import Header from "@/component/client/layout/Header";
import Aside from "@/component/client/layout/Aside";
import Main from "@/component/client/layout/Main";

export default function Template({ children }: { children: React.ReactNode }) {
  console.log("exec: Template");
  // console.log(children);

  return (
    <Flowbite>
      <Header></Header>
      <Aside></Aside>
      <Main>{children}</Main>
    </Flowbite>
  );
}
