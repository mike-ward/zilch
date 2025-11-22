// zilch: a playful project simulating an installer experience!
// Nothing actually happens ("zilch"), for humor and entertainment.
// Inspired by https://github.com/buyukakyuz/install-nothing
// Demonstrates the V term module.

import math
import os
import runtime
import term
import time
import rand

fn main() {
	term.clear()
	run_installer()
}

fn run_installer() {
	show_preamble()
	install_steps := [
		init_system,
		update_bios,
		boot_sequence,
		load_boot_loader,
		setup_file_system,
		configure_system,
		setup_network,
		init_hardware,
		init_database,
		start_services,
		retro_mode,
		set_localization,
		optimize_install
	]
	for step in install_steps {
		step()
	}
	show_title('>>>> The End <<<<<')
}

// Utility Output Functions

fn show_title(s string) { term.bold(term.cyan(s)) }
fn show_info(s string) { term.gray(s) }
fn show_fail(s string) { term.red(s) }
fn show_bold(s string) { term.bold(s) }
fn show_dim(s string) { term.dim(s) }
fn br() { println('') }
fn wait_short() { time.sleep_ms(350 + rand.intn(200) or { 50 }) }
fn wait_medium() { time.sleep_ms(650 + rand.intn(300) or { 75 }) }
fn wait_long() { time.sleep_ms(1250 + rand.intn(600) or { 200 }) }

fn spinner(msg string) {
	term.write(term.yellow(msg))
	time.sleep_ms(250)
	term.write('\r')
}

fn show_progress(msg string, percent int) {
	term.write('${msg} [${percent}%]')
	time.sleep_ms(200)
	println('')
}

// Installer Steps (Refactored for modularity)
fn show_preamble() {
	show_info('=================================================================')
	show_info('         UNIVERSAL SYSTEM INSTALLER v3.2.1 (Build 1999)')
	show_info('=================================================================')
	br()
	show_fail('*** THIS IS A SIMULATION - NO ACTUAL INSTALLATION OCCURRING ***')
	show_bold('Press Ctrl+C to exit at any time')
	br()
	wait_medium()
}

fn init_system() {
	spinner('Initializing installation environment...')
	wait_short()
	spinner('Detecting hardware configuration...')
	wait_short()
	spinner('Calibrating flux capacitor...')
	wait_short()
}

fn update_bios() {
	show_title('> BIOS/Firmware Update Sequence')
	wait_short()
	show_info('╔═══════════════════════════════════════════════════════════════╗')
	show_info('║  American Megatrends BIOS (C)2003-2025                        ║')
	show_info('║  AMIBIOS v08.00.15                                            ║')
	show_info('╚═══════════════════════════════════════════════════════════════╝')

	br()
	show_dim('BIOS Date:   11/15/2025  S/N: B3D2-D0DE-065C-97F1')
	show_dim('System Date: ${time.now()}')
	show_dim('System:      ${os.uname().nodename}')

	br()
	show_info('Performing POST (Power-On Self Test)...')
	wait_long()
	show_dim('CPU:       Meaningless Model Number')
	show_dim('CPU Cores: ${runtime.nr_cpus()} physical')
	show_dim('CPU Speed: Never fast enough')

	br()
	show_info('Testing Memory...')
	tm := u64(runtime.total_memory() or { 0 })
	show_info('  Total Memory: ${readable_size(tm)} (${num_with_commas(tm)})')

	br()
	show_info('Detecting IDE Devices...')
	show_dim('Primary Master   [0x1F0-0x1F7]: WDC WD2000JB-00GVC0')
	show_dim('Primary Slave    [0x1F0-0x1F7]: None')
	show_dim('Secondary Master [0x170-0x177]: ATAPI CD-ROM')
	show_dim('Secondary Slave  [0x170-0x177]: None')

	br()
	show_info('Scanning PCI bus...')
	show_dim('Probing slots...')
	show_dim('Found 00:09.0 - VGA Compatible Controller')
	wait_short()
}

// Placeholders for steps you may expand as needed
fn boot_sequence() { spinner('Running boot sequence...'); wait_short() }
fn load_boot_loader() { spinner('Loading boot loader...'); wait_short() }
fn setup_file_system() { spinner('Setting up file system...'); wait_short() }
fn configure_system() { spinner('Configuring system...'); wait_short() }
fn setup_network() { spinner('Setting up network...'); wait_short() }
fn init_hardware() { spinner('Initializing hardware...'); wait_short() }
fn init_database() { spinner('Setting up database...'); wait_short() }
fn start_services() { spinner('Starting services...'); wait_short() }
fn retro_mode() { spinner('Engaging retro mode...'); wait_short() }
fn set_localization() { spinner('Setting localization...'); wait_short() }
fn optimize_install() { spinner('Optimizing installation...'); wait_short() }

// Utility for formatting numbers
fn num_with_commas(num u64) string {
	mut s := num.str()
	mut i := s.len
	for i > 3 {
		i -= 3
		s = '${s.substr(0, i)},${s.substr(i, s.len - i)}'
	}
	return s
}

// Utility for readable memory sizes
fn readable_size(num u64) string {
	if num > 1024 * 1024 * 1024 {
		return '${(num / (1024 * 1024 * 1024)):3.1f} GB'
	} else if num > 1024 * 1024 {
		return '${(num / (1024 * 1024)):3.1f} MB'
	} else if num > 1024 {
		return '${(num / 1024):3.1f} KB'
	}
	return '${num} B'
}