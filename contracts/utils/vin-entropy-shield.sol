// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VinEntropyShield is Ownable, Pausable {
    mapping(address => uint256) public lastCallBlock;
    mapping(address => uint256) public callFrequency;

    uint256 public frequencyThreshold = 3; // max calls per block
    uint256 public gasThreshold = 100000;  // low gas warning

    event EntropyDetected(address indexed source, string reason);
    event ShieldTriggered(address indexed source);
    event ShieldReset();

    modifier entropyGuard() {
        // Detect rapid repeated calls
        if (lastCallBlock[msg.sender] == block.number) {
            callFrequency[msg.sender]++;
            if (callFrequency[msg.sender] > frequencyThreshold) {
                emit EntropyDetected(msg.sender, "High call frequency");
                _pause();
                emit ShieldTriggered(msg.sender);
            }
        } else {
            callFrequency[msg.sender] = 1;
            lastCallBlock[msg.sender] = block.number;
        }

        // Detect low gas griefing
        if (gasleft() < gasThreshold) {
            emit EntropyDetected(msg.sender, "Low gas grief attempt");
        }

        _;
    }

    function resetShield() external onlyOwner {
        _unpause();
        emit ShieldReset();
    }

    function protectedAction() external whenNotPaused entropyGuard {
        // Your protected logic here
    }

    function updateThresholds(uint256 _freq, uint256 _gas) external onlyOwner {
        frequencyThreshold = _freq;
        gasThreshold = _gas;
    }
}
