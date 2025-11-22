// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToCosmicSignalVerificationGrid {
    string public batchID = "1321.9.110";
    string public steward = "Vinvin";

    address public admin;

    struct Signal {
        string source;
        string frequency;
        bool verified;
        uint256 timestamp;
    }

    mapping(bytes32 => Signal) public signalRegistry;

    event SignalLogged(bytes32 indexed key, string source, string frequency);
    event SignalVerified(bytes32 indexed key, bool verified);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSignal(string memory source, string memory frequency) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(source, frequency, block.timestamp));
        signalRegistry[key] = Signal(source, frequency, false, block.timestamp);
        emit SignalLogged(key, source, frequency);
    }

    function verifySignal(bytes32 key, bool status) public onlyAdmin {
        signalRegistry[key].verified = status;
        emit SignalVerified(key, status);
    }

    function getSignal(bytes32 key) public view returns (string memory source, string memory frequency, bool verified, uint256 timestamp) {
        Signal memory s = signalRegistry[key];
        return (s.source, s.frequency, s.verified, s.timestamp);
    }
}
