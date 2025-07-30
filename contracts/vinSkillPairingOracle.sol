// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSkillPairingOracle {
    address public scrollsmith;
    uint public pairingCount;

    struct Pairing {
        string applicantName;
        string skillTrack;
        string dreamJob;
        string orgName;
        bool ethicsAligned;
        uint pairingScore;
    }

    mapping(uint => Pairing) public scrollPairings;

    event PairingCreated(string applicantName, string orgName, uint score, bool ethicsAligned);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only the scrollsmith may summon divine pairings.");
        _;
    }

    // 🔮 Create a symbolic pairing between applicant and org
    function createPairing(
        string memory applicantName,
        string memory skillTrack,
        string memory dreamJob,
        string memory orgName,
        bool ethicsAligned
    ) public onlyScrollsmith {
        uint score = calculateScore(skillTrack, ethicsAligned);
        scrollPairings[pairingCount++] = Pairing(applicantName, skillTrack, dreamJob, orgName, ethicsAligned, score);
        emit PairingCreated(applicantName, orgName, score, ethicsAligned);
    }

    // ⚖️ Score calculation based on alignment & skill intensity
    function calculateScore(string memory skillTrack, bool ethicsAligned) internal pure returns (uint) {
        uint base = bytes(skillTrack).length * 10;
        uint bonus = ethicsAligned ? 100 : 0;
        return base + bonus;
    }

    // 🌱 View pairing info
    function getPairing(uint id) public view returns (
        string memory applicantName,
        string memory skillTrack,
        string memory dreamJob,
        string memory orgName,
        bool ethicsAligned,
        uint pairingScore
    ) {
        Pairing memory p = scrollPairings[id];
        return (p.applicantName, p.skillTrack, p.dreamJob, p.orgName, p.ethicsAligned, p.pairingScore);
    }

    // 🧙 Transfer scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 View total pairings
    function totalPairings() public view returns (uint) {
        return pairingCount;
    }
}
