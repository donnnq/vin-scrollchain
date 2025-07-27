// SPDX-License-Identifier: DIGNITY
pragma solidity ^0.8.17;

contract vinUpliftDominion {
    address public scrollLord;

    struct UpliftRecord {
        string nation;
        uint256 educationScore;
        uint256 dignityScore;
        uint256 peaceIndex;
        uint256 animalCareIndex;
        uint256 totalDominionScore;
    }

    mapping(address => UpliftRecord) public dominionLedger;
    address[] public contributors;

    event DominionScoreLogged(address indexed nation, string name, uint256 score);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Unauthorized scroll invocation.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function logUpliftScore(
        address nationAddr,
        string memory name,
        uint256 educationScore,
        uint256 dignityScore,
        uint256 peaceIndex,
        uint256 animalCareIndex
    ) public onlyScrollLord {
        uint256 totalScore = educationScore + dignityScore + peaceIndex + animalCareIndex;

        dominionLedger[nationAddr] = UpliftRecord(
            name,
            educationScore,
            dignityScore,
            peaceIndex,
            animalCareIndex,
            totalScore
        );
        contributors.push(nationAddr);

        emit DominionScoreLogged(nationAddr, name, totalScore);
    }

    function viewNationUplift(address nationAddr) public view returns (UpliftRecord memory) {
        return dominionLedger[nationAddr];
    }

    function topScrollContributors() public view returns (address[] memory) {
        return contributors;
    }
}
