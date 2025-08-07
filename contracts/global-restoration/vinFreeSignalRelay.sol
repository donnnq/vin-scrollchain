// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinFreeSignalRelay — Global Edition
/// @author Vinvin
/// @notice Broadcasts verified civic, emotional, and restoration signals across nations
/// @dev Supports multi-nation logging and global resonance tracking

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
    mapping(string => uint256[]) public nationSignals;

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

        nationSignals[_nation].push(signalCount);

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

    function getNationSignalIds(string memory _nation) public view returns (uint256[] memory) {
        return nationSignals[_nation];
    }

    function getNationLatestSignal(string memory _nation) public view returns (Signal memory) {
        uint256[] memory ids = nationSignals[_nation];
        require(ids.length > 0, "No signals for this nation");
        return signals[ids[ids.length - 1]];
    }
}
