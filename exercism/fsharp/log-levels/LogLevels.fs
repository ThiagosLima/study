module LogLevels

let message (logLine: string): string =
    (logLine.Split ':' |> Array.last).Trim()

let logLevel(logLine: string): string =
    let start = logLine.IndexOf '[' + 1
    let finish = logLine.IndexOf ']' - 1
    logLine.[start .. finish].Trim().ToLower()

let reformat(logLine: string): string =
    sprintf "%s (%s)" (message logLine) (logLevel logLine)