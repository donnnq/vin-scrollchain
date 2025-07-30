// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinCivicEchoStream.sol — Archives civic scroll echoes into a public ritual log
/// @author Vinvin + Copilot

contract vinCivicEchoStream {
    struct Echo {
        uint256 timestamp;
        string originScroll;
        string echoType;
        string content;
    }

    address public archivist;
    Echo[] public stream;

    event EchoArchived(uint256 index, string originScroll, string echoType, string content, uint256 timestamp);
    event ArchivistChanged(address oldArchivist, address newArchivist);

    modifier onlyArchivist() {
        require(msg.sender == archivist, "Not authorized");
        _;
    }

    constructor() {
        archivist = msg.sender;
    }

    function archiveEcho(string calldata _originScroll, string calldata _echoType, string calldata _content) external onlyArchivist {
        Echo memory newEcho = Echo({
            timestamp: block.timestamp,
            originScroll: _originScroll,
            echoType: _echoType,
            content: _content
        });

        stream.push(newEcho);
        emit EchoArchived(stream.length - 1, _originScroll, _echoType, _content, block.timestamp);
    }

    function getEcho(uint256 index) external view returns (Echo memory) {
        require(index < stream.length, "Invalid index");
        return stream[index];
    }

    function updateArchivist(address _newArchivist) external onlyArchivist {
        emit ArchivistChanged(archivist, _newArchivist);
        archivist = _newArchivist;
    }

    function totalEchoes() external view returns (uint256) {
        return stream.length;
    }
}
