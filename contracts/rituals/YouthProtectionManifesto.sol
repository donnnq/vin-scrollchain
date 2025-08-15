// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract YouthProtectionManifesto {
    address public steward;
    mapping(string => bool) public citySigned;
    mapping(string => string) public civicVow;
    string[] public signatories;

    event ManifestoSigned(string indexed city, string vow);
    event YouthRightDeclared(string right);

    string[] public youthRights;

    constructor() {
        steward = msg.sender;

        // Initial soulbound rights
        youthRights.push("Right to dignity, not detention");
        youthRights.push("Right to shelter, not shame");
        youthRights.push("Right to education, not exploitation");
        youthRights.push("Right to emotional restoration");
        youthRights.push("Right to civic inclusion");
    }

    function signManifesto(string memory city, string memory vow) public {
        require(!citySigned[city], "City already signed");
        citySigned[city] = true;
        civicVow[city] = vow;
        signatories.push(city);
        emit ManifestoSigned(city, vow);
    }

    function declareYouthRight(string memory right) public {
        require(msg.sender == steward, "Only steward can declare rights");
        youthRights.push(right);
        emit YouthRightDeclared(right);
    }

    function getRights() public view returns (string[] memory) {
        return youthRights;
    }

    function getSignatories() public view returns (string[] memory) {
        return signatories;
    }

    function getVow(string memory city) public view returns (string memory) {
        return civicVow[city];
    }
}
