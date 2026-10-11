FROM archlinux
RUN pacman -Syy --noconfirm && pacman -S base-devel git curl --noconfirm
COPY ikki.sh .
RUN chmod 755 ./ikki.sh
ENTRYPOINT ["./ikki.sh"]
