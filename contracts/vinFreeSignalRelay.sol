// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinFreeSignalRelay {
    struct Broadcast {
        address author;
        string headline;
        string content;
        string commentary;
        uint256 timestamp;
        bytes32 veritasHash;
    }

    mapping(uint256 => Broadcast) public archive;
    uint256 public signalCount;

    event SignalTransmitted(uint256 indexed signalId, address indexed author, string headline);

    function transmitSignal(
        string memory _headline,
        string memory _content,
        string memory _commentary
    ) public {
        bytes32 _veritasHash = keccak256(abi.encodePacked(_headline, _content));
        signalCount++;
        archive[signalCount] = Broadcast(
            msg.sender,
            _headline,
            _content,
            _commentary,
            block.timestamp,
            _veritasHash
        );

        emit SignalTransmitted(signalCount, msg.sender, _headline);
    }

    function verifySignal(uint256 _signalId) public view returns (bool) {
        Broadcast memory b = archive[_signalId];
        bytes32 checkHash = keccak256(abi.encodePacked(b.headline, b.content));
        return checkHash == b.veritasHash;
    }

    function retrieveCommentary(uint256 _signalId) public view returns (string memory) {
        return archive[_signalId].commentary;
    }
}
