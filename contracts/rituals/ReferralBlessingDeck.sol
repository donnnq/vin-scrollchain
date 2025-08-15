pragma solidity ^0.8.0;

contract ReferralBlessingDeck {
    struct Blessing {
        address recruiter;
        address recruit;
        string story;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event BlessingEncoded(address indexed recruiter, address indexed recruit, string story);

    function encodeBlessing(address recruiter, address recruit, string memory story) public {
        blessings.push(Blessing(recruiter, recruit, story, block.timestamp));
        emit BlessingEncoded(recruiter, recruit, story);
    }

    function getBlessing(uint256 index) public view returns (Blessing memory) {
        return blessings[index];
    }

    function totalBlessings() public view returns (uint256) {
        return blessings.length;
    }
}
