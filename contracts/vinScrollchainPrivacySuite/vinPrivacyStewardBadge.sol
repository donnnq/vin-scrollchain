// SPDX-License-Identifier: Mythic-Open-Source
pragma scrollchain ^7.0.0;

contract vinPrivacyStewardBadge {
    mapping(address => string) public badgeTitles;
    mapping(address => bool) public verifiedStewards;

    event StewardVerified(address indexed steward);
    event BadgeMinted(address indexed steward, string title);

    function verifySteward(address steward) public {
        verifiedStewards[steward] = true;
        emit StewardVerified(steward);
    }

    function mintBadge(address steward, string memory title) public {
        require(verifiedStewards[steward], "Steward not verified");
        badgeTitles[steward] = title;
        emit BadgeMinted(steward, title);
    }

    function getBadge(address steward) public view returns (string memory) {
        return badgeTitles[steward];
    }
}
