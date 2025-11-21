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
	preamble()
	initializing_system()
	bios_firmware()
}

fn preamble() {
	title('> Preamble')
	info('=================================================================')
	info('         UNIVERSAL SYSTEM INSTALLER v3.2.1 (Build 1999)')
	info('=================================================================')
	br()
	fail('*** THIS IS A SIMULATION - NO ACTUAL INSTALLATION OCCURRING ***')
	bold('Press Ctrl+C to exit at any time')
	br()
	wait_medium()
}

fn initializing_system() {
	spin('Initializing installation environment...')
	wait_short()
	spin('Detecting hardware configuration...')
	wait_short()
	spin('Calibrating flux capacitor...')
	wait_short()
}

fn bios_firmware() {
	title('> BIOS/Firmware Update Sequence')
	wait_short()
	info('╔═══════════════════════════════════════════════════════════════╗')
	info('║  American Megatrends BIOS (C)2003-2025                        ║')
	info('║  AMIBIOS v08.00.15                                            ║')
	info('╚═══════════════════════════════════════════════════════════════╝')

	br()
	spin_tail('', term.dim('BIOS Date:   11/15/2025  S/N: B3D2-D0DE-065C-97F1'))
	spin_tail('', term.dim('System Date: ${time.now()}'))
	spin_tail('', term.dim('System:      ${os.uname().nodename}'))

	br()
	log('Performing POST (Power-On Self Test)...')
	wait_long()
	spin_tail('CPU:       ', 'Meaningless Model Number')
	spin_tail('CPU Cores: ', '${runtime.nr_cpus()} physical')
	spin_tail('CPU Speed: ', 'Never fast enough')

	br()
	progress('Testing Memory: ')
	tm := u64(runtime.total_memory() or { 0 })
	log('  Total Memory: ${readable_size(tm, false)} (${num_with_commas(tm)})')

	br()
	log('Detecting IDE Devices...')
	spin_tail('', 'Primary Master   [0x1F0-0x1F7]: WDC WD2000JB-00GVC0')
	spin_tail('', 'Primary Slave    [0x1F0-0x1F7]: None')
	spin_tail('', 'Secondary Master [0x170-0x177]: ATAPI CD-ROM')
	spin_tail('', 'Secondary Slave  [0x170-0x177]: None')

	br()
	log('Scanning PCI bus...')
	print('  Probing 00:00.0 - 00:1F.7:')
	progress(' ')
	spinn('Found 00:09.0 - VGA Compatible Controller')
	spinn('Found 00:1B.0 - Ethernet Controller')
	spinn('Found 00:1F.3 - SMBus Controller')
	br()
	spin_tail('', 'Network Adapters: 19 detected')
	spin_tail('', 'USB Controller:   UHCI/EHCI Compatible')
	spin_tail('', 'USB Device(s):    0 connected')
	br()
	spin_tail('Host OS:         ', 'Darwin')
	spin_tail('Storage Devices: ', '2 disk(s) found')
	spin_tail('System UUID:     ', '00C3A225-B7AB-4867-6F13-B7294D4BBB64')
	br()
	log('Boot Device Priority:')
	spin_tail('', '1st: Hard Disk Drive')
	spin_tail('', '2nd: CD-ROM Drive')
	spin_tail('', '3rd: Network Boot')

	br()
	alert('═══════════════════════════════════════════════════════════════')
	alert('CRITICAL: Firmware Update Sequence Initiated')
	alert('═══════════════════════════════════════════════════════════════')
	br()
	spin_tail('Backing up current BIOS to NVRAM... ', term.green('OK'))
	spin_tail('Verifying backup integrity... CRC32 ', term.green('OK'))
	br()
	warn('  WARNING: Do NOT power off or restart during this process!')
	warn('  System damage may occur if interrupted!')
	br()
	progress('  Erasing flash sectors: ')
	progress('  Writing new firmware: ')
	progress('  Verifying firmware: ')
	br()
	log('  Firmware update complete!')
	log('  Updating ESCD (Extended System Configuration Data)...')
	br()
	wait_short()
	success('  BIOS update successful - AMIBIOS v08.00.15 -> v08.00.16')
	success('  System will initialize with new firmware')
}

// ===============================
//            helpers
// ===============================

fn wait_short() {
	time.sleep(time.millisecond * 500)
}

fn wait_medium() {
	time.sleep(time.millisecond * 1500)
}

fn wait_long() {
	time.sleep(time.millisecond * 2500)
}

fn spin_tail(s string, tail string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ['|', '/', '-', '\\'], ' ', tail)
}

fn spinn(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ['|', '/', '-', '\\'], ' ', '')
}

fn spin(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ['|', '/', '-', '\\'], '✓', '')
}

fn spinner(s string, duration int, spin_chars []string, final string, tail string) {
	interval := 65
	count := duration / interval
	print('  ${s}')
	term.cursor_back(real_length(s) + 2)
	for i := 0; i < count; i++ {
		print(spin_chars[i % spin_chars.len])
		term.cursor_back(1)
		flush_stdout()
		time.sleep(interval * time.millisecond)
	}
	print(term.green(final))
	flush_stdout()
	term.cursor_forward(real_length(s) + 1)
	log(tail)
}

fn progress(front string) {
	len := 20
	term.hide_cursor()
	defer { term.show_cursor() }
	print(front)
	for i := 0; i < len; i++ {
		percent := int(f32(i) / f32(len) * 10)
		bar := '[${'#'.repeat(i)}${' '.repeat(len - i)}] ${percent}0% '
		print(bar)
		term.cursor_back(bar.len)
		flush_stdout()
		snooze := rand.int_in_range(75, 250) or { 100 }
		time.sleep(snooze * time.millisecond)
	}
	println('[${term.green('#'.repeat(len))}] 100%')
}

fn text(s string) {
	println(s)
}

fn br() {
	println('')
}

fn title(s string) {
	br()
	alert(term.bold(s))
	br()
}

fn bold(s string) {
	println(term.bold(s))
}

fn log(s string) {
	println(s)
}

fn success(s string) {
	println(term.green(s))
}

fn fail(s string) {
	println(term.failed(s))
}

fn info(s string) {
	println(term.bright_cyan(s))
}

fn alert(s string) {
	println(term.yellow(s))
}

fn warn(s string) {
	println(term.hex(0xffaf00, s))
}

// red : can't use `error` for fn name
fn red(s string) {
	println(term.bright_red(s))
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

fn real_length(s string) int {
	return term.strip_ansi(s).runes().len
}
