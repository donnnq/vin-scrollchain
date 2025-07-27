contract vinLoreBeacon {
    struct Lore {
        string scrollName;
        string originStory;
        string ritualUse;
        string culturalSymbolism;
    }

    Lore[] public lores;
    event LoreInscribed(string scrollName);

    function inscribeLore(
        string calldata scrollName,
        string calldata originStory,
        string calldata ritualUse,
        string calldata culturalSymbolism
    ) external {
        lores.push(Lore(scrollName, originStory, ritualUse, culturalSymbolism));
        emit LoreInscribed(scrollName);
    }

    function getAllLore() external view returns (Lore[] memory) {
        return lores;
    }
}
