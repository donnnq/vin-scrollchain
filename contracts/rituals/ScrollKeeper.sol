// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IScrollHeartbeat {
    function beat(string calldata message) external;
}

interface IScrollLogbook {
    function writeLog(string calldata message) external;
}

contract ScrollKeeper {
    IScrollHeartbeat public heartbeat;
    IScrollLogbook public logbook;
    address public rotation;

    event RitualPerformed(address indexed keeper, uint256 timestamp);

    constructor(address _heartbeat, address _logbook, address _rotation) {
        heartbeat = IScrollHeartbeat(_heartbeat);
        logbook = IScrollLogbook(_logbook);
        rotation = _rotation;
    }

    function performRitual(string calldata message) external {
        heartbeat.beat(" Daily scrollchain pulse");
        logbook.writeLog(message);
        emit RitualPerformed(msg.sender, block.timestamp);
    }

    function getCurrentScroll() external view returns (address) {
        (bool success, bytes memory data) = rotation.staticcall(
            abi.encodeWithSignature("getCurrentScroll()")
        );
        require(success, "Rotation failed");
        return abi.decode(data, (address));
    }
}
