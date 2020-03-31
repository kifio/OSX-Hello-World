//
//  EggTimer.swift
//  HelloWorld_osx
//
//  Created by imurashov private on 31.03.20.
//  Copyright © 2020 imurashov. All rights reserved.
//

import Cocoa

protocol EggTimerDelegate {
    func timeRemainingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval)
    func timerHasFinished(_ timer: EggTimer)
}

class EggTimer {
    
    var timer: Timer? = nil
    var startTime: Date?
    var duration: TimeInterval = 6 * 60
    var elapsedTime: TimeInterval = 0
    
    var isStopped: Bool {
        return timer == nil && elapsedTime == 0
    }
    var isPaused: Bool {
        return timer == nil && elapsedTime > 0
    }
    
    var delegate: EggTimerDelegate?
    
    func timerAction() -> Bool {
        guard let startTime = startTime else {
            return false
        }
        
        elapsedTime = -startTime.timeIntervalSinceNow
        let secondsRemaining = (duration - elapsedTime).rounded()
        
        if secondsRemaining <= 0 {
            resetTimer()
            delegate?.timerHasFinished(self)
            return false
        } else {
            delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
            return true
        }
    }
    
    func startTimer() {
        startTime = Date()
        elapsedTime = 0
        setupTimer()
    }
    
    func resumeTimer() {
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        setupTimer()
    }
    
    private func setupTimer() {
        DispatchQueue.global(qos: .background).async {

            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                              repeats: true) { [weak self] timer in
                                                if self?.timerAction() != true {
                                                    self?.stopTimer()
                                                }
            }
            
            if let timer = self.timer {
                let runLoop = RunLoop.current
                runLoop.add(timer, forMode: .default)
                runLoop.run()
            }
        }
    }
    
    // 3
    func stopTimer() {
        // really just pauses the timer
        timer?.invalidate()
        timer = nil
        timerAction()
    }
    
    // 4
    func resetTimer() {
        // stop the timer & reset back to start
        timer?.invalidate()
        timer = nil
        
        startTime = nil
        duration = 360
        elapsedTime = 0
        
        timerAction()
    }
}
