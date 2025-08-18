// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinWorkerBlessingSuite {
    string public suiteName = "Worker Blessing Suite";
    string public steward = "Vinvin, Civic Architect";
    string public activationDate = "2025-08-18";
    string public glyph = "🛠️🧿📜❤️";

    struct WorkerProfile {
        string name;
        string role;
        string emotionalAPR;
        string dignityNote;
        uint256 blessingTimestamp;
    }

    mapping(address => WorkerProfile) public blessedWorkers;

    event WorkerBlessed(address indexed worker, string name, string role, string emotionalAPR, string dignityNote, uint256 timestamp);
    event ScrollInvocation(string message, uint256 timestamp);

    modifier onlyUnblessed() {
        require(bytes(blessedWorkers[msg.sender].name).length == 0, "Already blessed.");
        _;
    }

    function blessWorker(string memory _name, string memory _role, string memory _emotionalAPR, string memory _dignityNote) public onlyUnblessed {
        blessedWorkers[msg.sender] = WorkerProfile({
            name: _name,
            role: _role,
            emotionalAPR: _emotionalAPR,
            dignityNote: _dignityNote,
            blessingTimestamp: block.timestamp
        });

        emit WorkerBlessed(msg.sender, _name, _role, _emotionalAPR, _dignityNote, block.timestamp);
        emit ScrollInvocation("Worker blessed. Labor ritualized. Dignity restored.", block.timestamp);
    }

    function getBlessing(address _worker) public view returns (string memory, string memory, string memory, string memory, uint256) {
        WorkerProfile memory profile = blessedWorkers[_worker];
        return (profile.name, profile.role, profile.emotionalAPR, profile.dignityNote, profile.blessingTimestamp);
    }

    function suiteWisdom() public pure returns (string memory) {
        return "A worker is not a tool—they are a steward. Every task is a scroll. Every shift is a ritual.";
    }
}
