
export default function Main({ children }: { children: React.ReactNode }) {
  console.log("exec: Main");

  return (
    <main id="main" className={`relative p-4 md:ml-64 h-auto pt-20 min-h-svh`}>
      <p>TemplateMain</p>
      {children}
      <div style={{ minHeight: '1000px' }}>after children</div>
    </main>
  );
}