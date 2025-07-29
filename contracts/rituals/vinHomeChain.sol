// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vinMortgageVerse.sol";

contract vinHomeChain {
    address public founder;
    vinMortgageVerse public mortgageVerse;
    mapping(address => bool) public approvedHomeSeekers;
    mapping(address => string) public scrollLineageTags;
    mapping(address => uint256) public dignityScore;

    event HomeRightGranted(address seeker, string scrollTag);
    event ScrollLineageUpdated(address seeker, string newTag);
    event DignityBoosted(address seeker, uint256 amount);

    constructor(address _mortgageVerseAddress) {
        founder = msg.sender;
        mortgageVerse = vinMortgageVerse(_mortgageVerseAddress);
    }

    function requestHomeRite(address seeker, string memory lineageTag) public {
        require(msg.sender == founder, "Only founder can approve rites");
        require(mortgageVerse.isMortgageSacramentApproved(), "Mortgage not eligible");
        approvedHomeSeekers[seeker] = true;
        scrollLineageTags[seeker] = lineageTag;
        dignityScore[seeker] = 100; // Base dignity score
        emit HomeRightGranted(seeker, lineageTag);
    }

    function boostDignity(address seeker, uint256 amount) public {
        require(msg.sender == founder, "Only founder can boost");
        dignityScore[seeker] += amount;
        emit DignityBoosted(seeker, amount);
    }

    function updateScrollLineage(address seeker, string memory newTag) public {
        require(msg.sender == seeker, "Only seeker may update lineage");
        scrollLineageTags[seeker] = newTag;
        emit ScrollLineageUpdated(seeker, newTag);
    }

    function tag() public pure returns (string memory) {
        return "vinHomeChain: Ritual DAO for Soulbound Housing Rights";
    }
}
