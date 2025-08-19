// vinDistrictBadgeMint.sol

contract vinDistrictBadgeMint {
    mapping(address => string) public badgeTitle;
    event BadgeMinted(address steward, string title);

    function mintBadge(address _steward, string memory _title) public {
        badgeTitle[_steward] = _title;
        emit BadgeMinted(_steward, _title);
    }
}
