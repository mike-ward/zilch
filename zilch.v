// zilch is a playful project that simulates the experience of running an
// installer, but in reality, it doesn’t actually do anything (“zilch”). It’s
// designed for humor and entertainment, mimicking installer visuals and
// progress, but accomplishes nothing under the hood.
//
// `zilch` demonstrates the utility of V's builtin `term` module.
// Inspired by: https://github.com/buyukakyuz/install-nothing
//
import math
import os
import runtime
import term
import time
import rand

fn main() {
	installer_run()
}

fn installer_run() {
	term.clear()
	preamble()
	initializing_system()
	bios_firmware()
	boot()
	boot_loader()
	file_system()
	system()
	network()
	hardware()
	database()
	services()
	retro()
	localization()
	optimization()
	section('>>>> The End <<<<<')
}

fn preamble() {
	info('=================================================================')
	info('         UNIVERSAL SYSTEM INSTALLER v3.2.1 (Build 1999)')
	info('=================================================================')
	br()
	fail('*** THIS IS A SIMULATION - NO ACTUAL INSTALLATION OCCURRING ***')
	bold('Press Ctrl+C to exit at any time')
	br()
	sleep_medium()
}

fn initializing_system() {
	spin('Initializing installation environment...')
	sleep_short()
	spin('Detecting hardware configuration...')
	sleep_short()
	spin('Calibrating flux capacitor...')
	sleep_short()
}

fn bios_firmware() {
	section('> BIOS/Firmware Update Sequence')
	sleep_short()
	info('╔═══════════════════════════════════════════════════════════════╗')
	info('║  American Megatrends BIOS (C)2003-2025                        ║')
	info('║  AMIBIOS v08.00.15                                            ║')
	info('╚═══════════════════════════════════════════════════════════════╝')

	br()
	spin_tail('', term.dim('BIOS Date:   11/15/2025  S/N: B3D2-D0DE-065C-97F1'))
	spin_tail('', term.dim('System Date: ${time.now()}'))
	spin_tail('', term.dim('System:      ${os.uname().nodename}'))

	br()
	p('Performing POST (Power-On Self Test)...')
	sleep_long()
	spin_tail('CPU:       ', 'Meaningless Model Number')
	spin_tail('CPU Cores: ', '${runtime.nr_cpus()} physical')
	spin_tail('CPU Speed: ', 'Never fast enough')

	br()
	progress('Testing Memory: ')
	tm := u64(runtime.total_memory() or { 0 })
	p('  Total Memory: ${readable_size(tm, false)} (${num_with_commas(tm)})')

	br()
	p('Detecting IDE Devices...')
	spin_tail('', 'Primary Master   [0x1F0-0x1F7]: WDC WD2000JB-00GVC0')
	spin_tail('', 'Primary Slave    [0x1F0-0x1F7]: None')
	spin_tail('', 'Secondary Master [0x170-0x177]: ATAPI CD-ROM')
	spin_tail('', 'Secondary Slave  [0x170-0x177]: None')

	br()
	p('Scanning PCI bus...')
	pnr('  Probing 00:00.0 - 00:1F.7:')
	progress(' ')
	spin_hide('Found 00:09.0 - VGA Compatible Controller')
	spin_hide('Found 00:1B.0 - Ethernet Controller')
	spin_hide('Found 00:1F.3 - SMBus Controller')
	br()
	spin_tail('', 'Network Adapters: 19 detected')
	spin_tail('', 'USB Controller:   UHCI/EHCI Compatible')
	spin_tail('', 'USB Device(s):    0 connected')
	br()
	uname := os.uname()
	spin_tail('Host OS:         ', '${uname.sysname} (${uname.release})')
	spin_tail('Storage Devices: ', '2 disk(s) found')
	spin_tail('System UUID:     ', '00C3A225-B7AB-4867-6F13-B7294D4BBB64')
	br()
	p('Boot Device Priority:')
	spin_tail('', '1st: Hard Disk Drive')
	spin_tail('', '2nd: CD-ROM Drive')
	spin_tail('', '3rd: Network Boot')

	br()
	alert('╔═════════════════════════════════════════════════════════════╗')
	alert('║  CRITICAL: Firmware Update Sequence Initiated               ║')
	alert('╚═════════════════════════════════════════════════════════════╝')
	sleep_medium()
	br()
	spin_tail('Backing up current BIOS to NVRAM... ', term.green('OK'))
	spin_tail('Verifying backup integrity... CRC32 ', term.green('OK'))
	sleep_short()
	br()
	warn('  WARNING: Do NOT power off or restart during this process!')
	warn('  System damage may occur if interrupted!')
	br()
	progress('  Erasing flash sectors: ')
	progress('  Writing new firmware: ')
	progress('  Verifying firmware: ')
	br()
	ps('  Firmware update complete!')
	br()
	spin_tail_long('Updating ESCD (Extended System Configuration Data)... ', term.green('OK'))
	sleep_medium()
	br()
	success('  BIOS update successful - AMIBIOS v08.00.15 -> v08.00.16')
	success('  System will initialize with new firmware')
}

fn boot() {
	section('> Kernel Boot Sequence')
	pds('q6asm_callback: payload size of 8 is less than expected.')
	pds('stk3x3x_enable_ps: ps input event=1, ps=0')
	pds('q6core_get_service_version: Failed to get service size for service id 7 with error -95')
	pds('cmdq_host_alloc_tdl: desc_size: 1024 data_sz: 63488 slot-sz: 32')
	sleep_short()
	pds('daixianze msm_mi2s_snd_shutdown tert_mi2s_gpio_p')
	pds('/cpus/cpu@101: Missing clock-frequency property')
	sleep_short()
	pds('q6asm_callback: payload size of 8 is less than expected.')
	pds('Active_profile:speaker, next_profile:speaker')
	pds('qcrypto 1de0000.qcrypto: qcrypto-ecb-aes')
	pds("init: Service 'vendor.qcom-sh' (pid 867) exited with status 0")
	sleep_medium()
	pds('himax_tp: probe of 4-0048 failed with error -1')
	pds('IRQ5 no longer affine to CPU5')
	pds("init: starting service 'vendor.nfc_hal_service'...}")
}

fn boot_loader() {
	section('> Bootloader Installation')
	ps('Installing GRUB2 bootloader...')
	pds('Probing devices for bootloader installation...')
	pds('Installing for x86_64-pc platform to /dev/sda')
	br()
	sleep_short()

	p('Generating grub configuration file...')
	sleep_short()
	pds('Found linux image: /boot/vmlinuz-5.4.0-42-generic')
	pds('Found initrd image: /boot/initrd.img-5.4.0-42-generic')
	pds('Found linux image: /boot/vmlinuz-5.4.0-40-generic')
	sleep_short()
	pds('Found initrd image: /boot/initrd.img-5.4.0-40-generic')
	sleep_short()
	pds('Found linux image: /boot/vmlinuz-5.4.0-39-generic')
	pds('Found initrd image: /boot/initrd.img-5.4.0-39-generic')
	pds('Found Windows Boot Manager on /dev/sda1')
	br()
	sleep_short()

	ps('Installing bootloader to disk...')
	spin_tail_long(term.dim('Installation finished. No error reported. '), term.green('OK'))
	br()

	spin('Reticulating splines...')
}

fn file_system() {
	section('> Filesystem Operations')
	p('Creating ext4 filesystem on /dev/sda2...')
	pds('mke2fs 1.45.5 (07-Jan-2020)')
	pds('Creating filesystem with 73436249 4k blocks and 18359062 inodes')
	pds('Filesystem UUID: 8f3e1a2b-4c5d-6e7f-8a9b-0c1d2e3f4a5b')
	pds('Superblock backups stored on blocks:')
	pds('    32768')
	pds('    98304')
	pds('    163840')
	pds('    229376')
	pds('    294912')

	br()
	progress('Allocating group tables: ')
	progress('Writing inode tables: ')
	br()
	pds('Creating journal (32768 blocks):')
	sleep_medium()
	success('  done')
	pds('Writing superblocks and filesystem accounting information:')
	sleep_medium()
	success('  done')

	br()
	ps('Running filesystem check...')
	pds('e2fsck 1.45.5 (07-Jan-2020)')
	pds('Pass 1: Checking inodes, blocks, and sizes')
	pds('Pass 2: Checking directory structure')
	pds('Pass 3: Checking directory connectivity')
	pds('Pass 4: Checking reference counts')
	pds('Pass 5: Checking group summary information')
	success('/dev/sda2: 11/2048000 files (0.0% non-contiguous), 200000/8192000 blocks')
}

fn system() {
	section('> System Component Installation')
	spin_tail('Loading kernel modules', term.green(' [OK]'))
	spin_tail('Mounting root filesystem (ext3)', term.green(' [OK]'))
	spin_tail('Initializing network interfaces', term.green(' [OK]'))
	spin_tail('Starting system daemons', term.green(' [OK]'))
	spin_tail('Configuring system clock', term.green(' [OK]'))
	br()
	progress('Building module dependencies: ')
}

fn network() {
	section('> Network Configuration')
	br()
	ps('Configuring network interfaces...')
	pds('  Interface: eth0')
	ps(term.green('  Requesting DHCP lease on eth0...'))
	pds('  IP Address: 192.168.239.190')
	pds('  Netmask: 255.255.255.0')
	pds('  Gateway: 192.168.50.1')
	pds('  DNS: 8.8.8.8, 8.8.4.4')
	br()
	ps('  Configuring DNS resolution...')
	sleep_medium()
	pds('  Updating /etc/resolv.conf')
	br()
	sleep_medium()
	ps('  Reversing polarity of neutron flow...')
}

fn hardware() {
	section('> Hardware Driver Installation')
	pws('Detecting: VGA Graphics Adapter', ' [FOUND]')
	ps('   └─ Loading driver: VESA 2.0 Compatible')
	pws('Detecting: Sound Blaster 16', ' [FOUND]')
	ps('   └─ Loading driver: Creative Labs')
	pws('Detecting: Intel 82540EM Gigabit Ethernet', ' [FOUND]')
	ps('   └─ Loading driver: e1000')
	pws('Detecting: PS/2 Mouse', ' [FOUND]')
	ps('   └─ Loading driver: Generic')
	pws('Detecting: USB 1.1 UHCI Controller', ' [FOUND]')
	ps('   └─ Loading driver: usb-uhci')
}

fn database() {
	section('> Database Server Installation')
	ps('Installing PostgreSQL Server 14.2...')
	ps('  Initializing database cluster...')
	pds('The files belonging to this database system will be owned by user "postgres".')
	pds('This user must also own the server process.')
	br()
	ps('Creating database files...')
	pds('  creating global/pg_control')
	sleep_short()
	pds('  creating base/1/pg_filenode.map')
	sleep_short()
	pds('  creating base/template1/pg_version')
	sleep_short()
	pds('  creating pg_wal/000000010000000000000001')
	sleep_short()
	pds('  creating pg_multixact/offsets/0000')
	br()
	sleep_short()
	progress('Initializing system tables: ')
	br()
	ps('Creating template databases...')
	sleep_medium()
	success('  Success. You can now start the database server using:')
	pds('  pdpg_ctl -D /var/lib/postgresql/dataa')
	br()
	alert('Mirror unresponsive, trying alternate server')
	ps('  Reconnecting to mirror.oldsoft.org')
	sleep_long()
	success('  Success')
}

fn services() {
	section('Starting system services...')
	ok_first_format('[ OK ] Started Network Manager....')
	ok_first_format('[ OK ] Started Network Name Resolution....')
	ok_first_format('[ OK ] Started OpenSSH server daemon....')
	ok_first_format('[ OK ] Started Regular background program processing daemon....')
	ok_first_format('[ OK ] Started System Logging Service....')
	ok_first_format('[ OK ] Started D-Bus System Message Bus....')
	ok_first_format('[ OK ] Started Avahi mDNS/DNS-SD Stack....')
	ok_first_format('[ OK ] Started CUPS Scheduler....')
	ok_first_format('[ OK ] Started Bluetooth service....')
	ok_first_format('[ OK ] Started The Apache HTTP Server....')
	br()
	pds('Loaded 10 services, 10 active')
}

fn retro() {
	section('> Retro Software Installation')
	ps('Installing Netscape Navigator v4.79')
	ps('  Checking for previous installation...')
	progress('  Extracting files (14.9MB): ')
	pds('  Creating shortcuts...')
	br()
	ps('Installing WinAmp v2.95')
	progress('  Extracting files (3.3MB): ')
	pds('  Creating shortcuts...')
	br()
	ps('Installing mIRC v6.35')
	progress('  Extracting files (1.8MB): ')
	pds('  Creating shortcuts...')
	br()
	ps('Installing RealPlayer v8.0')
	progress('  Extracting files (8.7MB): ')
	pds('  Creating shortcuts...')
	pds('  Registering file associations...)')
	br()
	ps('Installing Adobe Flash Player v7.0')
	progress('  Extracting files (2.3MB): ')
	pds('  Creating shortcuts...')
}

fn localization() {
	section('> Localization Configuration')
	pds('Generating locales...')
	pds('Generating locale en_US.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale en_GB.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale de_DE.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale fr_FR.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale es_ES.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale ja_JP.UTF-8...')
	sleep_medium()
	success('done')
	pds('Generating locale zh_CN.UTF-8...')
	sleep_medium()
	success('done')
	br()
	progress('Building locale archive: ')
	br()
	ps('Configuring timezone...')
	sleep_short()
	pds('Timezone set to: Europe/Berlin')
}

fn optimization() {
	section('> System Optimization')
	progress('Defragmenting installation cache ')
	progress('Rebuilding font cache ')
	progress('Updating shared library cache ')
	progress('Optimizing package database ')
	progress('Generating manual page index ')
}

// ===============================
//            helpers
// ===============================

fn sleep_x_short() {
	time.sleep(time.millisecond * 100)
}

fn sleep_short() {
	time.sleep(time.millisecond * 500)
}

fn sleep_medium() {
	time.sleep(time.millisecond * 1500)
}

fn sleep_long() {
	time.sleep(time.millisecond * 2500)
}

fn spin_tail_long(s string, tail string) {
	spinner(s, 3000, ' ', tail)
}

fn spin_tail(s string, tail string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ' ', tail)
}

fn spin_hide(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ' ', '')
}

fn spin(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, '✓', '')
}

const spin_chars = ['|', '/', '-', '\\']

fn spinner(s string, duration int, final string, tail string) {
	interval := 65
	count := duration / interval
	pnr('  ${s}')
	term.cursor_back(display_length(s) + 2)
	for i := 0; i < count; i++ {
		pnr(spin_chars[i % spin_chars.len])
		term.cursor_back(1)
		flush_stdout()
		time.sleep(interval * time.millisecond)
	}
	pnr(term.green(final))
	flush_stdout()
	term.cursor_forward(display_length(s) + 1)
	p(tail)
}

fn progress(front string) {
	len := 20
	term.hide_cursor()
	defer { term.show_cursor() }
	pnr(front)
	for i := 0; i < len; i++ {
		percent := int(f32(i) / f32(len) * 10)
		bar := '[${'#'.repeat(i)}${' '.repeat(len - i)}] ${percent}0% '
		pnr(bar)
		term.cursor_back(bar.len)
		flush_stdout()
		snooze := rand.int_in_range(75, 250) or { 100 }
		time.sleep(snooze * time.millisecond)
	}
	p('[${term.green('#'.repeat(len))}] 100%')
}

fn ok_first_format(s string) {
	pnr(term.cyan(s.replace('OK', '**')))
	flush_stdout()
	snooze := rand.int_in_range(200, 700) or { 300 }
	time.sleep(snooze * time.millisecond)
	term.cursor_back(display_length(s))
	success(s)
}

fn p(s string) {
	println(s)
}

fn pd(s string) {
	p(term.dim(s))
}

fn ps(s string) {
	p(s)
	sleep_x_short()
}

fn pds(s string) {
	pd(s)
	sleep_x_short()
}

fn pnr(s string) {
	print(s)
}

fn pws(s string, t string) {
	pnr(s)
	snooze := rand.int_in_range(200, 500) or { 250 }
	time.sleep(snooze * time.millisecond)
	println(term.green(t))
}

fn br() {
	p('')
}

fn section(s string) {
	br()
	alert(term.bold(s))
	br()
	sleep_short()
}

fn bold(s string) {
	p(term.bold(s))
}

fn success(s string) {
	p(term.green(s))
}

fn fail(s string) {
	p(term.failed(s))
}

fn info(s string) {
	p(term.bright_cyan(s))
}

fn alert(s string) {
	p(term.yellow(s))
}

fn warn(s string) {
	p(term.hex(0xffaf00, s))
}

// perror : can't use `error` for fn name
fn perror(s string) {
	p(term.bright_red(s))
}

fn num_with_commas(num u64) string {
	if num < 1000 {
		return num.str()
	}
	return num_with_commas(num / 1000) + ',${(num % 1000):03u}'
}

fn readable_size(size u64, si bool) string {
	kb := if si { f64(1024) } else { f64(1000) }
	mut sz := f64(size)
	for unit in ['', 'K', 'M', 'G', 'T', 'P', 'E', 'Z'] {
		if sz < kb {
			readable := match unit == '' {
				true { size.str() }
				else { math.round_sig(sz + .049999, 1).str() }
			}
			bytes := match true {
				unit == '' { '' }
				si { '' }
				else { 'B' }
			}
			return '${readable}${unit}${bytes}'
		}
		sz /= kb
	}
	return size.str()
}

fn display_length(s string) int {
	return utf8_str_visible_length(term.strip_ansi(s))
}
