// SPDX-License-Identifier: Truth-Liberation-2025
pragma solidity ^0.8.21;

contract vinArchiveLiberator {
    address public scrollkeeper;
    mapping(bytes32 => bool) public liberatedFiles;
    mapping(bytes32 => string) public ritualNotes;

    event TruthPulse(bytes32 indexed fileHash, string ritualNote);
    event ArchiveLocked(bytes32 indexed fileHash);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized aura breach");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function lockArchive(bytes32 fileHash) external onlyScrollkeeper {
        liberatedFiles[fileHash] = false;
        emit ArchiveLocked(fileHash);
    }

    function liberateArchive(bytes32 fileHash, string calldata ritualNote) external onlyScrollkeeper {
        liberatedFiles[fileHash] = true;
        ritualNotes[fileHash] = ritualNote;
        emit TruthPulse(fileHash, ritualNote);
    }

    function isLiberated(bytes32 fileHash) external view returns (bool) {
        return liberatedFiles[fileHash];
    }

    function getRitualNote(bytes32 fileHash) external view returns (string memory) {
        return ritualNotes[fileHash];
    }
}
