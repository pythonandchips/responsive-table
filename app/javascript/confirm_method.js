import { TemplateInstance } from '@github/template-parts'
import { template } from "./template"

const confirmDialogTmpl = template(`
  <template>
    <dialog class="c-modal">
      <form method="dialog">
        <div class="c-modal__content">
          <div class="c-modal__body">
            {{ message }}
          </div>
          <div class="c-modal__actions">
            <button value="ok" type="submit" class="c-button c-button--destructive" autofocus>
              Ok
            </button>
            <button type="submit" class="c-button">
              Cancel
            </button>
          </div>
        </div>
      </form>
    </dialog>
  </template>
`)

const confirmMethod = (message, element) => {
  return new Promise((resolve) => {
    const confirmDialogFragment = new TemplateInstance(
      confirmDialogTmpl, { message }
    )

    const confirmDialog = confirmDialogFragment.querySelector("dialog")

    confirmDialog.addEventListener("close", (evt) => {
      console.log("close")
      evt.preventDefault();

      resolve(evt.target.returnValue === "ok");

      evt.target.remove();
    });

    element.after(confirmDialogFragment);
    confirmDialog.showModal();
  });
}

export default confirmMethod;
