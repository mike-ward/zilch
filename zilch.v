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
	boot()
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
	p('Performing POST (Power-On Self Test)...')
	wait_long()
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
	p('Boot Device Priority:')
	spin_tail('', '1st: Hard Disk Drive')
	spin_tail('', '2nd: CD-ROM Drive')
	spin_tail('', '3rd: Network Boot')

	br()
	alert('╔═════════════════════════════════════════════════════════════╗')
	alert('║  CRITICAL: Firmware Update Sequence Initiated               ║')
	alert('╚═════════════════════════════════════════════════════════════╝')
	wait_medium()
	br()
	spin_tail('Backing up current BIOS to NVRAM... ', term.green('OK'))
	spin_tail('Verifying backup integrity... CRC32 ', term.green('OK'))
	wait_short()
	br()
	warn('  WARNING: Do NOT power off or restart during this process!')
	warn('  System damage may occur if interrupted!')
	br()
	progress('  Erasing flash sectors: ')
	progress('  Writing new firmware: ')
	progress('  Verifying firmware: ')
	br()
	p('  Firmware update complete!')
	spin_tail_long('Updating ESCD (Extended System Configuration Data)... ', term.green('OK'))
	wait_medium()
	br()
	success('  BIOS update successful - AMIBIOS v08.00.15 -> v08.00.16')
	success('  System will initialize with new firmware')
}

fn boot() {
	title('> Kernel Boot Sequence')
	pd('q6asm_callback: payload size of 8 is less than expected.')
	pd('stk3x3x_enable_ps: ps input event=1, ps=0')
	pd('q6core_get_service_version: Failed to get service size for service id 7 with error -95')
	pd('cmdq_host_alloc_tdl: desc_size: 1024 data_sz: 63488 slot-sz: 32')
	wait_short()
	pd('daixianze msm_mi2s_snd_shutdown tert_mi2s_gpio_p')
	pd('/cpus/cpu@101: Missing clock-frequency property')
	wait_short()
	pd('q6asm_callback: payload size of 8 is less than expected.')
	pd('Active_profile:speaker, next_profile:speaker')
	pd('qcrypto 1de0000.qcrypto: qcrypto-ecb-aes')
	pd("init: Service 'vendor.qcom-sh' (pid 867) exited with status 0")
	wait_medium()
	pd('himax_tp: probe of 4-0048 failed with error -1')
	pd('IRQ5 no longer affine to CPU5')
	pd("init: starting service 'vendor.nfc_hal_service'...}")
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

fn spin_tail_long(s string, tail string) {
	spinner(s, 3000, ' ', tail)
}

fn spin_tail(s string, tail string) {
	duration := rand.int_in_range(500, 1500) or { 500 }
	spinner(s, duration, ' ', tail)
}

fn spinn(s string) {
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

fn p(s string) {
	println(s)
}

fn pnr(s string) {
	print(s)
}

fn br() {
	p('')
}

fn title(s string) {
	br()
	alert(term.bold(s))
	br()
	wait_short()
}

fn bold(s string) {
	p(term.bold(s))
}

fn pd(s string) {
	p(term.dim(s))
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
