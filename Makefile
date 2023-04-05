# $FreeBSD$

PORTNAME=	pfSense-pkg-urbackup
PORTVERSION=	2.5.23
PORTREVISION=	3
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	coreteam@pfsense.org
COMMENT=	pfSense package urbackup

LICENSE=	APACHE20

NO_BUILD=	yes
NO_MTREE=	yes

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	PORTNAME=${PORTNAME}

do-extract:
	${MKDIR} ${WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/pkg
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}${PREFIX}/sbin
	${MKDIR} ${STAGEDIR}${PREFIX}/share/urbackup
	${MKDIR} ${STAGEDIR}${PREFIX}/var/urbackup
	${MKDIR} ${STAGEDIR}${PREFIX}/var/urbackup/data
	${MKDIR} ${STAGEDIR}${PREFIX}/share/urbackup/scripts
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/rc.d
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/urbackup
	${MKDIR} ${STAGEDIR}/etc/inc/priv
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} -m 0644 ${FILESDIR}${PREFIX}/pkg/urbackup.xml \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/pkg/urbackup.xml \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} -m 755 ${FILESDIR}${PREFIX}/etc/rc.d/urbackup.sh \
		${STAGEDIR}${PREFIX}/etc/rc.d
	${INSTALL_DATA} -m 755 ${FILESDIR}${PREFIX}/sbin/urbackupclientbackend \
		${STAGEDIR}${PREFIX}/sbin/
	${INSTALL_DATA} -m 755 ${FILESDIR}${PREFIX}/bin/urbackupclientctl \
		${STAGEDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${FILESDIR}/etc/inc/priv/urbackup.priv.inc \
		${STAGEDIR}/etc/inc/priv
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/share/urbackup/scripts/* \
		${STAGEDIR}${PREFIX}/share/urbackup/scripts/
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/share/urbackup/updates_h.dat \
		${STAGEDIR}${PREFIX}/share/urbackup/
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/share/urbackup/urbackup_ecdsa409k1.pub \
		${STAGEDIR}${PREFIX}/share/urbackup/
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/etc/urbackup/* \
		${STAGEDIR}${PREFIX}/etc/urbackup/
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/var/urbackup/version.txt \
		${STAGEDIR}${PREFIX}/var/urbackup/
	${INSTALL_DATA} ${FILESDIR}${DATADIR}/info.xml \
		${STAGEDIR}${DATADIR}
	@${REINPLACE_CMD} -i '' -e "s|%%PKGVERSION%%|${PKGVERSION}|" \
		${STAGEDIR}${DATADIR}/info.xml

.include <bsd.port.mk>
