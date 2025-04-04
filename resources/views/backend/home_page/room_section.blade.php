@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl_style')

@section('content')
  <div class="page-header">
    <h4 class="page-title">{{ __('Room Section') }}</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('admin.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Home Page') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Room Section') }}</a>
      </li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-lg-10">
              <div class="card-title">{{ __('Update Room Section') }}</div>
            </div>

            <div class="col-lg-2">
              @includeIf('backend.partials.languages')
            </div>
          </div>
        </div>

        <div class="card-body pt-5 pb-5">
          <div class="row">
            <div class="col-lg-6 offset-lg-3">
              <form id="ajaxForm"
                action="{{ route('admin.home_page.update_room_section', ['language' => request()->input('language')]) }}"
                method="post">
                @csrf
                <div class="form-group">
                  <label for="">{{ __('Room Section Title*') }}</label>
                  <input type="text" class="form-control" name="room_section_title"
                    value="{{ $data != null ? $data->room_section_title : '' }}">
                  <p id="err_room_section_title" class="em text-danger mt-1 mb-0"></p>
                </div>

                @if ($settings->theme_version == 'theme_one' || $settings->theme_version == 'theme_two')
                  <div class="form-group">
                    <label for="">{{ __('Room Section Subtitle*') }}</label>
                    <input type="text" class="form-control" name="room_section_subtitle"
                      value="{{ $data != null ? $data->room_section_subtitle : '' }}">
                    <p id="err_room_section_subtitle" class="em text-danger mt-1 mb-0"></p>
                  </div>
                @endif
                @if ($settings->theme_version == 'theme_one')
                  <div class="form-group">
                    <label for="">{{ __('Room Section Text*') }}</label>
                    <textarea class="form-control" name="room_section_text" rows="5" cols="80">{{ $data != null ? $data->room_section_text : '' }}</textarea>
                    <p id="err_room_section_text" class="em text-danger mt-1 mb-0"></p>
                  </div>
                @endif
              </form>
            </div>
          </div>
        </div>

        <div class="card-footer">
          <div class="row">
            <div class="col-12 text-center">
              <button type="submit" id="submitBtn" class="btn btn-success">
                {{ __('Update') }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
