"""Halo 2 main menu: dark navy and steel-blue Pygments style."""

from pygments.style import Style
from pygments.token import (
    Comment, Error, Generic, Keyword, Name, Number, Operator, Punctuation,
    String, Text, Token,
)


class Halo2Style(Style):
    name = "halo2"
    background_color = "#0a1322"
    highlight_color = "#1d3d66"
    line_number_color = "#3a5273"
    line_number_background_color = "#0a1322"

    styles = {
        Token:               "#c4ddf7",
        Text:                "#c4ddf7",
        Error:               "bold #e07a7f",
        Comment:             "italic #4f6a8f",
        Comment.Preproc:     "noitalic #d4b066",
        Keyword:             "#6fb3ff",
        Keyword.Constant:    "#d4b066",
        Keyword.Type:        "#b1a3f0",
        Operator:            "#8fb4dc",
        Operator.Word:       "#6fb3ff",
        Punctuation:         "#8fb4dc",
        Name:                "#c4ddf7",
        Name.Builtin:        "#9fcfff",
        Name.Builtin.Pseudo: "#9fcfff",
        Name.Function:       "bold #e6f3ff",
        Name.Class:          "#b1a3f0",
        Name.Namespace:      "#b1a3f0",
        Name.Exception:      "#b1a3f0",
        Name.Decorator:      "#d4b066",
        Name.Constant:       "#d4b066",
        Name.Tag:            "#6fb3ff",
        Name.Attribute:      "#86def2",
        Name.Label:          "#7cc4ff",
        String:              "#86def2",
        String.Escape:       "#9fcfff",
        String.Interpol:     "#9fcfff",
        Number:              "#d4b066",
        Generic.Heading:     "bold #7cc4ff",
        Generic.Subheading:  "bold #7cc4ff",
        Generic.Inserted:    "#82d6ad bg:#12301f",
        Generic.Deleted:     "#e07a7f bg:#2a1216",
        Generic.Error:       "#e07a7f",
        Generic.Emph:        "italic",
        Generic.Strong:      "bold",
        Generic.Prompt:      "#5d7799",
        Generic.Output:      "#5d7799",
        Generic.Traceback:   "#e07a7f",
    }
