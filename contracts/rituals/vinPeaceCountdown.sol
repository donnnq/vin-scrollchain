// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinPeaceCountdown {
    address public scrollWatcher = msg.sender;
    uint256 public deadline;
    bool public missed;

    event PeaceDeadlineMissed(address commander);
    event CountdownStarted(uint256 endTime);

    modifier onlyWatcher() {
        require(msg.sender == scrollWatcher, "Unauthorized");
    }

    function startCountdown(uint256 durationInDays, address commander) public onlyWatcher {
        deadline = block.timestamp + (durationInDays * 1 days);
        emit CountdownStarted(deadline);
    }

    function checkDeadline(address commander) public {
        if (block.timestamp > deadline && deadline != 0) {
            missed = true;
            emit PeaceDeadlineMissed(commander);
        }
    }
}
