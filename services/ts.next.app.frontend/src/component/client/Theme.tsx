import { Inter } from "next/font/google";

import { useTheme } from "@/component/client/ThemeContext";
import Backdrop from "@/component/client/common/Backdrop";

const inter = Inter({ subsets: ["latin"] });

export default function Theme({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {

  const theme = useTheme();

  console.log('Theme: ');
  console.log(theme);

  let classNames = [];
  classNames.push(inter.className);

  if (theme.mobile.sidebar.visible.status) {
    classNames.push(theme.mobile.sidebar.visible.className);
  }

  return (
    <html lang="ja">
      <body className={`${classNames.join(' ')}`}>
        <div className={`antialiased bg-gray-50 dark:bg-gray-900`}>
          {children}
        </div>
        <Backdrop></Backdrop>
      </body>
    </html>
  );
}
