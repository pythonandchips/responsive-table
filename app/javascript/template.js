const template = (str) => {
  const doc = new DOMParser().parseFromString(str, "text/html")
  return doc.querySelector("template")
}

export { template }
