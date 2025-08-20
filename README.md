# 基于 LaTeX 的二次元 / ACGN 亲友扩列条 / 自介条模板

## 简介

这是一个使 LaTeX 构建的 ACGN 亲友扩列条 / 自介条模板，可用于微博、半次元、Lofter、QQ空间等平台。这个项目可以被视作对 LaTeX 功能的可能性和多元性的一种探索和尝试，适合一些连扩列条都要用 LaTeX 的成分复杂的 ACGN \TeX Geek，或者如果你刚刚掌握了一些基本的 LaTeX 技巧技能，这个项目也可以作为你的第一个练手项目。

由于扩列条可以被理解为二次元的一种简历 (Resume)，而且是条形的 (bar)，故将文档类命名为 `resubar.cls` (Resume - bar)。很合理吧？

## 功能与特性

### 颜色主题

模板包含 `dark` 和 `light` 两套颜色主题，亮色模式采用樱花粉背景和黑色前景；暗色模式使用深灰色背景和暖白色前景。可以通过在文档开头载入文档类时的 `\documentclass[]{}` 命令的参数处指定。以下是一个简单的示例。

```tex
\documentclass[light]{resubar}
\documentclass[dark]{resubar}
```

### 多彩盒子

基于 `tcolorbox` 宏包，本模板为用户准备了多个不同样式的多彩盒子，以供用户灵活使用，声明自己的各种二次元属性。包括：

1. `preference`：向你的列表声明自己的偏好。
2. `notice`：提醒你的列表一些需要注意的事情。
3. `minefield`：向你的列表介绍你的雷点。
4. `oshi`：向你的列表介绍你的推。
5. `cp`：向你的列表介绍你吃的 CP。

### 生成 PNG 文件

一般情况下，在 ACGN 社区我们通常使用 PNG 作为扩列条 / 自介条的文件格式。你当然可以直接将编译产生的 PDF 文件发给你想要扩列的亲友，或者直接使用免费的在线文件格式转换平台。但是我还是编写了一个 Python 脚本 [`build_image.py`](build_image.py) 用于将 TeX 编译生成的 PDF 文件转换为图片格式。(因此您需要安装 Python 以及 `pdf2image` 库。)

### 效果展示

下图展现了该模板在亮色模式下的排版效果。该如果你想复现这个排版，你可以使用 `light, twocolumn, 10pt` 的文档类初始化参数来指定文档布局。

![展示效果](./figure/samples.png)

## 使用方法

### 环境配置

#### LaTeX 环境

您可以使用 LaTeX 的任何发行版来编译本模板，您可以使用 TeX Live 和 MiKTeX。

#### Python 环境

正如上文所述，您需要安装 Python 以及 `pdf2image` 库来运行 [`build_image.py`](build_image.py) 脚本。您可以使用以下命令来安装 `pdf2image`：

```bash
pip install pdf2image 
```

当然，如果您不想配置 Python 环境也可以利用您找到的任何其他工具来将 PDF 转换为 PNG 文件格式 (或者直接将 PDF 格式的文件发给您的亲友，如果您愿意的话)。

#### Bash 运行环境

本项目提供了一份 Makefile，因此您可以使用 `make` 命令来编译本项目。这需要您确保您的系统中安装了 Bash 运行环境。当然，如果您不使用 Makefile，也可以手动构建 PDF 文件然后运行 Python 脚本。

总而言之，本项目为您提供了诸多工具和自动化脚本来帮助您更轻松地使用这个模板，这些工具都可以灵活地使用。

### 使用 Makefile 完成自动构建

本项目提供了一个 Makefile，您可以使用 `make` 命令来自动构建 PDF 文件和 PNG 文件。您可以在终端中运行以下命令：

```bash
make all  # 自动生成 main.tex 对应的 PDF 和 PNG 文件
make  # 直接编译，相当于 make all
make pdf  # 仅生成 PDF 文件，不生成 PNG 文件
make png  # 生成 PNG 需要 PDF，所以还是相当于 make all
make clear  # 清理生成的辅助文件和中间文件
make clean  # 清理所有生成的文件，包括 PDF 和 PNG 文件
make example  # 编译示例文件
```

其中，`pdf` 编译规则默认使用 `latexmk -xelatex` 命令来编译 TeX 文件，您也可以根据需要修改 Makefile 中的编译规则。

## 项目与开源

### 开源贡献与帮助

如果您想要为本项目提供任何帮助，或者在使用过程中遇到了任何困难，都欢迎您在提交有关的 Issue。

### 许可证

项目基于 LPPL 许可证开源，关于许可证的诸多详情请参阅本项目的 [LICENSE](LICENSE.txt) 文件。
