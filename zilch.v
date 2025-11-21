import term
import time

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
	ok('         UNIVERSAL SYSTEM INSTALLER v3.2.1 (Build 1999)')
	orange('=================================================================')
	nl()
	failed('*** THIS IS A SIMULATION - NO ACTUAL INSTALLATION OCCURRING ***')
	ok('Press Ctrl+C to exit at any time')
	nl()
	wait_medium()
}

fn initializing_system() {
	spinner('Initializing installation environment...', 1000)
	wait_short()
	spinner('Detecting hardware configuration...', 1500)
	wait_short()
	spinner('Calibrating flux capacitor...', 1000)
	wait_short()
}

fn bios_firmware() {
	title('> BIOS/Firmware Update Sequence')
	wait_short()
	green('╔═══════════════════════════════════════════════════════════════╗')
	green('║  American Megatrends BIOS (C)2003-2025                        ║')
	green('║  AMIBIOS v08.00.15                                            ║')
	green('╚═══════════════════════════════════════════════════════════════╝')
	wait_short()
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

fn spinner(s string, duration int) {
	interval := 65
	count := duration / interval
	spin_chars := ['|', '/', '-', '\\']!
	print('  ${s}')
	term.cursor_back(s.len + 2)
	for i := 0; i < count; i++ {
		print(spin_chars[i % spin_chars.len])
		term.cursor_back(1)
		flush_stdout()
		time.sleep(interval * time.millisecond)
	}
	green('✓')
}

fn ok(s string) {
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
