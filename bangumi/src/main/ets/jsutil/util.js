export function extractCode(url) {
    const codeMatch = url.match(/code=([^&]+)/);
    return codeMatch ? codeMatch[1] : "";
}