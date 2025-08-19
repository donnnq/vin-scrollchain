// SPDX-License-Identifier: Mythic-Open-Source
pragma scrollchain ^7.0.0;

contract vinFanStewardBadgeDeck {
    mapping(address => string) public badgeTitles;
    mapping(address => bool) public verifiedParodyCreators;

    event BadgeMinted(address indexed creator, string title);
    event CreatorVerified(address indexed creator);

    function verifyCreator(address creator) public {
        verifiedParodyCreators[creator] = true;
        emit CreatorVerified(creator);
    }

    function mintBadge(address creator, string memory title) public {
        require(verifiedParodyCreators[creator], "Creator not verified");
        badgeTitles[creator] = title;
        emit BadgeMinted(creator, title);
    }

    function getBadge(address creator) public view returns (string memory) {
        return badgeTitles[creator];
    }
}
