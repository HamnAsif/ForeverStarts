import { Controller } from "@hotwired/stimulus"

export default class extends Controller
{
    static targets = ["modal"]
    open()
    {
        this.modalTarget.showModal();
        document.body.classList.add("overflow-hidden")
    }
    close() 
    {
    this.modalTarget.close()
    this.modalTarget.classList.add("hidden")
    this.backdropTarget.classList.add("hidden")
    }

}