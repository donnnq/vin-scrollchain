// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCommitSigil {
    event SigilEngraved(address indexed author, string message, string emotion, uint256 timestamp);
    event PactLinked(string repoLink, string civicIntent);
    event ScrollPhaseActivated(string phase, string description);

    address public scrollKeeper;

    struct Sigil {
        string message;
        string emotion;
        uint256 timestamp;
    }

    mapping(address => Sigil[]) public sigils;
    mapping(string => string) public pactLinks;
    string[] public scrollPhases;

    constructor() {
        scrollKeeper = msg.sender;
    }

    modifier onlyKeeper() {
        require(msg.sender == scrollKeeper, "You are not the designated scroll keeper.");
        _;
    }

    function engraveSigil(string memory message, string memory emotion) external {
        sigils[msg.sender].push(Sigil(message, emotion, block.timestamp));
        emit SigilEngraved(msg.sender, message, emotion, block.timestamp);
    }

    function linkPact(string memory repoLink, string memory civicIntent) external onlyKeeper {
        pactLinks[repoLink] = civicIntent;
        emit PactLinked(repoLink, civicIntent);
    }

    function activateScrollPhase(string memory phase, string memory description) external onlyKeeper {
        scrollPhases.push(phase);
        emit ScrollPhaseActivated(phase, description);
    }

    // View functions
    function getSigils(address author) public view returns (Sigil[] memory) {
        return sigils[author];
    }

    function getPactIntent(string memory repoLink) public view returns (string memory) {
        return pactLinks[repoLink];
    }

    function getAllPhases() public view returns (string[] memory) {
        return scrollPhases;
    }
}
