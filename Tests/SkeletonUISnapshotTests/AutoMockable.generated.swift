// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif
import SwiftUI
@testable import SkeletonUI
import Combine














class AngleInteractableMock: AngleInteractable {
    var presenter: AnglePresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: AnglePresenter!
    var animation: CurrentValueSubject<Animation?, Never> {
        get { return underlyingAnimation }
        set(value) { underlyingAnimation = value }
    }
    var underlyingAnimation: CurrentValueSubject<Animation?, Never>!
    var value: CurrentValueSubject<Double, Never> {
        get { return underlyingValue }
        set(value) { underlyingValue = value }
    }
    var underlyingValue: CurrentValueSubject<Double, Never>!
    var range: CurrentValueSubject<ClosedRange<Double>, Never> {
        get { return underlyingRange }
        set(value) { underlyingRange = value }
    }
    var underlyingRange: CurrentValueSubject<ClosedRange<Double>, Never>!

}
class AnimationInteractableMock: AnimationInteractable {
    var position: PositionInteractable {
        get { return underlyingPosition }
        set(value) { underlyingPosition = value }
    }
    var underlyingPosition: PositionInteractable!
    var opacity: OpacityInteractable {
        get { return underlyingOpacity }
        set(value) { underlyingOpacity = value }
    }
    var underlyingOpacity: OpacityInteractable!
    var radius: RadiusInteractable {
        get { return underlyingRadius }
        set(value) { underlyingRadius = value }
    }
    var underlyingRadius: RadiusInteractable!
    var angle: AngleInteractable {
        get { return underlyingAngle }
        set(value) { underlyingAngle = value }
    }
    var underlyingAngle: AngleInteractable!
    var type: CurrentValueSubject<AnimationType, Never> {
        get { return underlyingType }
        set(value) { underlyingType = value }
    }
    var underlyingType: CurrentValueSubject<AnimationType, Never>!

}
class AppearanceInteractableMock: AppearanceInteractable {
    var presenter: AppearancePresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: AppearancePresenter!
    var type: CurrentValueSubject<AppearanceType, Never> {
        get { return underlyingType }
        set(value) { underlyingType = value }
    }
    var underlyingType: CurrentValueSubject<AppearanceType, Never>!

}
class MultilineInteractableMock: MultilineInteractable {
    var presenter: MultilinePresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: MultilinePresenter!
    var line: CurrentValueSubject<Int, Never> {
        get { return underlyingLine }
        set(value) { underlyingLine = value }
    }
    var underlyingLine: CurrentValueSubject<Int, Never>!
    var lines: CurrentValueSubject<Int, Never> {
        get { return underlyingLines }
        set(value) { underlyingLines = value }
    }
    var underlyingLines: CurrentValueSubject<Int, Never>!
    var scale: CurrentValueSubject<CGFloat, Never> {
        get { return underlyingScale }
        set(value) { underlyingScale = value }
    }
    var underlyingScale: CurrentValueSubject<CGFloat, Never>!
    var spacing: CurrentValueSubject<CGFloat?, Never> {
        get { return underlyingSpacing }
        set(value) { underlyingSpacing = value }
    }
    var underlyingSpacing: CurrentValueSubject<CGFloat?, Never>!
    var scales: CurrentValueSubject<[Int: CGFloat]?, Never> {
        get { return underlyingScales }
        set(value) { underlyingScales = value }
    }
    var underlyingScales: CurrentValueSubject<[Int: CGFloat]?, Never>!

}
class OpacityInteractableMock: OpacityInteractable {
    var presenter: OpacityPresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: OpacityPresenter!
    var animation: CurrentValueSubject<Animation?, Never> {
        get { return underlyingAnimation }
        set(value) { underlyingAnimation = value }
    }
    var underlyingAnimation: CurrentValueSubject<Animation?, Never>!
    var value: CurrentValueSubject<Double, Never> {
        get { return underlyingValue }
        set(value) { underlyingValue = value }
    }
    var underlyingValue: CurrentValueSubject<Double, Never>!
    var range: CurrentValueSubject<ClosedRange<Double>, Never> {
        get { return underlyingRange }
        set(value) { underlyingRange = value }
    }
    var underlyingRange: CurrentValueSubject<ClosedRange<Double>, Never>!

}
class PositionInteractableMock: PositionInteractable {
    var presenter: PositionPresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: PositionPresenter!
    var animation: CurrentValueSubject<Animation?, Never> {
        get { return underlyingAnimation }
        set(value) { underlyingAnimation = value }
    }
    var underlyingAnimation: CurrentValueSubject<Animation?, Never>!
    var value: CurrentValueSubject<CGFloat, Never> {
        get { return underlyingValue }
        set(value) { underlyingValue = value }
    }
    var underlyingValue: CurrentValueSubject<CGFloat, Never>!
    var range: CurrentValueSubject<ClosedRange<CGFloat>, Never> {
        get { return underlyingRange }
        set(value) { underlyingRange = value }
    }
    var underlyingRange: CurrentValueSubject<ClosedRange<CGFloat>, Never>!

}
class RadiusInteractableMock: RadiusInteractable {
    var presenter: RadiusPresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: RadiusPresenter!
    var animation: CurrentValueSubject<Animation?, Never> {
        get { return underlyingAnimation }
        set(value) { underlyingAnimation = value }
    }
    var underlyingAnimation: CurrentValueSubject<Animation?, Never>!
    var value: CurrentValueSubject<CGFloat, Never> {
        get { return underlyingValue }
        set(value) { underlyingValue = value }
    }
    var underlyingValue: CurrentValueSubject<CGFloat, Never>!
    var range: CurrentValueSubject<ClosedRange<CGFloat>, Never> {
        get { return underlyingRange }
        set(value) { underlyingRange = value }
    }
    var underlyingRange: CurrentValueSubject<ClosedRange<CGFloat>, Never>!

}
class ShapeInteractableMock: ShapeInteractable {
    var presenter: ShapePresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: ShapePresenter!
    var type: CurrentValueSubject<ShapeType, Never> {
        get { return underlyingType }
        set(value) { underlyingType = value }
    }
    var underlyingType: CurrentValueSubject<ShapeType, Never>!

}
class SkeletonInteractableMock: SkeletonInteractable {
    var presenter: SkeletonPresenter {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: SkeletonPresenter!
    var shape: ShapeInteractable {
        get { return underlyingShape }
        set(value) { underlyingShape = value }
    }
    var underlyingShape: ShapeInteractable!
    var multiline: MultilineInteractable {
        get { return underlyingMultiline }
        set(value) { underlyingMultiline = value }
    }
    var underlyingMultiline: MultilineInteractable!
    var appearance: AppearanceInteractable {
        get { return underlyingAppearance }
        set(value) { underlyingAppearance = value }
    }
    var underlyingAppearance: AppearanceInteractable!
    var animation: AnimationInteractable {
        get { return underlyingAnimation }
        set(value) { underlyingAnimation = value }
    }
    var underlyingAnimation: AnimationInteractable!

}
