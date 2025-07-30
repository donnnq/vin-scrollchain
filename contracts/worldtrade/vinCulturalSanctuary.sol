contract vinCulturalSanctuary {
    mapping(string => bool) public protectedItems;

    event SanctuaryMarked(string item);

    function markSanctuary(string memory item) public {
        protectedItems[item] = true;
        emit SanctuaryMarked(item);
    }

    function isProtected(string memory item) public view returns (bool) {
        return protectedItems[item];
    }
}
