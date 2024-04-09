
export default function Backdrop() {
  console.log("exec: Backdrop");

  return (
    <div id="backdrop" className={`bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0`}></div>
  );
}