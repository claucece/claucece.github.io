SASS = sass --load-path=_sass
SCSS_SRC = css/main.scss
CSS_DEST = css/main.css
JEKYLL = bundle exec jekyll build

# Default target
all: css build

# Compile SCSS to CSS
css:
	$(SASS) $(SCSS_SRC) $(CSS_DEST)

# Build Jekyll site
build: css
	$(JEKYLL)

# Clean output
clean:
	rm -rf _site $(CSS_DEST)

.PHONY: all css build clean
