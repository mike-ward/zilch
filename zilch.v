// Zilch is an entertaining and amusing simulation of an installer.
// It demonstrates the utility of V's builtin `term` module.
// Inspiration is from: https://github.com/buyukakyuz/install-nothing
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
	orange('=================================================================')
	text('         UNIVERSAL SYSTEM INSTALLER v3.2.1 (Build 1999)')
	orange('=================================================================')
	nl()
	failed('*** THIS IS A SIMULATION - NO ACTUAL INSTALLATION OCCURRING ***')
	bold('Press Ctrl+C to exit at any time')
	nl()
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
	cyan('╔═══════════════════════════════════════════════════════════════╗')
	cyan('║  American Megatrends BIOS (C)2003-2025                        ║')
	cyan('║  AMIBIOS v08.00.15                                            ║')
	cyan('╚═══════════════════════════════════════════════════════════════╝')

	nl()
	spinn(term.dim('BIOS Date:   11/15/2025  S/N: B3D2-D0DE-065C-97F1'))
	spinn(term.dim('System Date: ${time.now()}'))
	spinn(term.dim('System:      ${os.uname().nodename}'))

	nl()
	text('Performing POST (Power-On Self Test)...')
	wait_long()
	spinn('CPU:       Meaningless Model Number')
	spinn('CPU Cores: ${runtime.nr_cpus()} physical')
	spinn('CPU Speed: Never fast enough')

	nl()
	progress('Testing Memory: ')
	tm := u64(runtime.total_memory() or { 0 })
	text('  Total Memory: ${readable_size(tm, false)} (${num_with_commas(tm)})')

	nl()
	text('Detecting IDE Devices...')
	spinn('Primary Master   [0x1F0-0x1F7]: WDC WD2000JB-00GVC0 ')
	spinn('Primary Slave    [0x1F0-0x1F7]: None                ')
	spinn('Secondary Master [0x170-0x177]: ATAPI CD-ROM        ')
	spinn('Secondary Slave  [0x170-0x177]: None                ')

	nl()
	text('Scanning PCI bus...')
	print('  Probing 00:00.0 - 00:1F.7:')
	progress(' ')
	spinn('Found 00:09.0 - VGA Compatible Controller')
	spinn('Found 00:1B.0 - Ethernet Controller')
	spinn('Found 00:1F.3 - SMBus Controller')
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

fn spinn(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ['|', '/', '-', '\\'], ' ')
}

fn spin(s string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ['|', '/', '-', '\\'], '✓')
}

fn spinner(s string, duration int, spin_chars []string, final string) {
	interval := 65
	count := duration / interval
	print('  ${s}')
	term.cursor_back(s.len + 2)
	for i := 0; i < count; i++ {
		print(spin_chars[i % spin_chars.len])
		term.cursor_back(1)
		flush_stdout()
		time.sleep(interval * time.millisecond)
	}
	green(final)
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
		time.sleep(100 * time.millisecond)
	}
	println('[${term.green('#'.repeat(len))}] 100%')
}

fn text(s string) {
	println(s)
}

fn nl() {
	println('')
}

fn title(s string) {
	nl()
	yellow(term.bold(s))
	nl()
}

fn bold(s string) {
	println(term.bold(s))
}

fn green(s string) {
	println(term.green(s))
}

fn yellow(s string) {
	println(term.yellow(s))
}

fn orange(s string) {
	println(term.hex(0xffaf00, s))
}

fn failed(s string) {
	println(term.failed(s))
}

fn cyan(s string) {
	println(term.bright_cyan(s))
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
