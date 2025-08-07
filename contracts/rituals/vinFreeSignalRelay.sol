// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinFreeSignalRelay
/// @author Vinvin
/// @notice A global media transparency and dignity relay contract
/// @dev Used to broadcast verified civic/emotional signals across nations

contract vinFreeSignalRelay {
    address public signalCaster;
    uint256 public signalCount;

    struct Signal {
        string nation;
        string message;
        string source;
        uint256 timestamp;
    }

    mapping(uint256 => Signal) public signals;

    event SignalBroadcasted(
        uint256 indexed id,
        string nation,
        string message,
        string source,
        uint256 timestamp
    );

    modifier onlyCaster() {
        require(msg.sender == signalCaster, "Unauthorized scrollcaster");
        _;
    }

    constructor() {
        signalCaster = msg.sender;
        signalCount = 0;
    }

    function broadcastSignal(
        string memory _nation,
        string memory _message,
        string memory _source
    ) public onlyCaster {
        signals[signalCount] = Signal({
            nation: _nation,
            message: _message,
            source: _source,
            timestamp: block.timestamp
        });

        emit SignalBroadcasted(
            signalCount,
            _nation,
            _message,
            _source,
            block.timestamp
        );

        signalCount++;
    }

    function updateCaster(address _newCaster) external onlyCaster {
        signalCaster = _newCaster;
    }

    function getSignal(uint256 _id) public view returns (Signal memory) {
        return signals[_id];
    }
}
