'use client';

import { createContext, useContext, useReducer } from 'react';

import { ThemeConfig } from "@/component/client/ThemeConfig";
import Theme from "@/component/client/Theme";

export const ThemeContext = createContext(null);
export const ThemeDispatchContext = createContext(null);

export function useTheme() {
  return useContext(ThemeContext);
}
export function useThemeDispatch() {
  return useContext(ThemeDispatchContext);
}

export function ThemeContextProvider({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {

  const [theme, dispatch] = useReducer(
    (state, action) => {
      console.log(state);
      console.log(action);
      switch (action.type) {
        case 'changed': {
          // https://ja.react.dev/reference/react/useReducer#ive-dispatched-an-action-but-the-screen-doesnt-update
          return JSON.parse(JSON.stringify(state));
        }
        default: {
          throw Error('Unknown action: ' + action.type);
        }
      }
    },
    ThemeConfig,
  );

  return (
    <ThemeContext.Provider value={theme}>
      <ThemeDispatchContext.Provider value={dispatch}>
        <Theme>{children}</Theme>
      </ThemeDispatchContext.Provider>
    </ThemeContext.Provider>
  );
}
